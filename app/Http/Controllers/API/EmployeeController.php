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


class EmployeeController extends Controller
{

    public function __construct()
    {
        $this->middleware('auth');
    }

    public function index(Request $request)
    {            
        $data = Employee::paginate($request->query('limit') ?? Constant::LIMIT_PAGINATION);

        return response()->json([
            'success' => true,
            'status' => 200,
            'data'=> $data
        ]);
    }


    public function create(Request $request)
    {   
        $validator = Validator::make($request->all(), [
            'first_name'      => 'string|required',
            'last_name'       => 'string|required',
            'id_company'      => 'required|integer|exists:companies,id',
            'email'           => 'nullable|email',
            'phone'           => 'nullable|min:10',
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

            $store = Employee::create([
                'first_name'  => $request->first_name,
                'last_name'   => $request->last_name,
                'id_company'  => $request->id_company,
                'email'       => $request->email,
                'phone'       => $request->phone
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
                'data'=> "Gagal Simpan Data Employee"
            ]);

        }     

    }


    public function update(Request $request, $id)
    {   
        $validator = Validator::make($request->all(), [
            'first_name'      => 'string|required',
            'last_name'       => 'string|required',
            'id_company'      => 'required|integer|exists:companies,id',
            'email'           => 'nullable|email',
            'phone'           => 'nullable|min:10'
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
       
            $store              = Employee::where('id',$id)->first();
            if(empty($store)){
                return response()->json([
                    'success' => false,
                    'status' => 401,
                    'data'=> "Empoyee tidak ada"
                ]);
             
            }

            $update_employee        = $store->update([
                'first_name'  => $request->first_name,
                'last_name'   => $request->last_name,
                'id_company'  => $request->id_company,
                'email'       => $request->email,
                'phone'       => $request->phone
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
                'data'=> "Gagal Simpan Data Employee"
            ]);

        }     

    }

    public function delete($id)
    {  

        $employee = Employee::where('id',$id)->first();

        if(empty($employee)){

            return response()->json([
                'success' => false,
                'status' => 401,
                'data'=> "Data Tidak di temukan"
            ]); 

        }

        Employee::where('id', $id)->delete();

        return response()->json([
            'success' => true,
            'status' => 200,
            'data'=> "Hapus Data Sukses"
        ]); 
            
        
    }


}
