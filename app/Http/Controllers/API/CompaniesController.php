<?php

namespace App\Http\Controllers\API;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\Companies;
use App\Employee;
use App\Constants\Constant;
use Validator;
use DB;
use Illuminate\Support\Facades\Storage;


class CompaniesController extends Controller
{

    public function __construct()
    {
        $this->middleware('auth');
    }

    public function index(Request $request)
    {            
        $data = Companies::paginate($request->query('limit') ?? Constant::LIMIT_PAGINATION);
        foreach ($data as $item) {
            if (!empty($item->logo)) {
                $item->logo = env('BASE_API') . Storage::url($item->logo);
            }
        }

        return response()->json([
            'success' => true,
            'status' => 200,
            'data'=> $data
        ]);
    }


    public function create(Request $request)
    {   
        $validator = Validator::make($request->all(), [
            'name'      => 'string|required',
            'email'     => 'string|email|nullable',
            'website'   => 'string|nullable',
            'logo'      => 'nullable|image|mimes:jpg,png,jpeg,gif,svg|max:2048',
        ]);

        if ($validator->fails()) {

            return response()->json([
                'success' => false,
                'status' => 401,
                'data'=> $validator->errors()
            ]);
         
        }

        DB::beginTransaction();
        try{
       
            if($request->hasfile('logo')){
                $path = Storage::putFile("/public/images/companies", $request->file('logo'));             

            }else{
                $path = '';
            } 

            $store = Companies::create([
                'name'  => $request->name,
                'email' => $request->email,
                'website' => $request->website,
                'logo' => $path
            ]);

            DB::commit();
            return response()->json([
                'success' => true,
                'status' => 200,
                'data'=> $store
            ]);
        
          
        } catch(\Error $e){

            DB::rollBack();
            return response()->json([
                'success' => false,
                'status' => 401,
                'data'=> "Gagal Simpan Data Companies"
            ]);

        }     

    }


    public function update(Request $request, $id)
    {   
        $validator = Validator::make($request->all(), [
            'name'      => 'string|required',
            'email'     => 'string|email|nullable',
            'website'   => 'string|nullable',
            'logo'      => 'nullable|image|mimes:jpg,png,jpeg,gif,svg|max:2048',
        ]);

        if ($validator->fails()) {

            return response()->json([
                'success' => false,
                'status' => 401,
                'data'=> $validator->errors()
            ]);
         
        }

        DB::beginTransaction();
        try{
       
            $store              = Companies::where('id',$id)->first();
            if(empty($store)){
                return response()->json([
                    'success' => false,
                    'status' => 401,
                    'data'=> "companies tidak ada"
                ]);
             
            }

            if($request->hasfile('logo')){
                $path = Storage::putFile("/public/images/companies", $request->file('logo'));             

            }else{
                $path = '';
            } 

            $update_user        = $store->update([
                'name'              => $request->name,
                'email'             => $request->email,
                'website'           => $request->website,
                'logo'              => $path
            ]); 
            
            DB::commit();
            return response()->json([
                'success' => true,
                'status' => 200,
                'data'=> $store
            ]);
        
          
        } catch(\Error $e){

            DB::rollBack();
            return response()->json([
                'success' => false,
                'status' => 401,
                'data'=> "Gagal Simpan Data Companies"
            ]);

        }     

    }

    public function delete($id)
    {  

        $companies = Companies::where('id',$id)->first();

        if(empty($companies)){

            return response()->json([
                'success' => false,
                'status' => 401,
                'data'=> "Data Tidak di temukan"
            ]); 
            
        }else{

            $jum_transaksi   = Employee::where('id_company', $id)
                            ->count();

            if ($jum_transaksi>0) {
                return response()->json([
                    'success' => false,
                    'status' => 401,
                    'data'=> "Company tidak dapat dihapus karena ada karyawan yang aktif"
                ]);
            }

            Companies::where('id', $id)->delete();

            return response()->json([
                'success' => true,
                'status' => 200,
                'data'=> "Hapus Data Sukses"
            ]); 
            
        }
    }


}
