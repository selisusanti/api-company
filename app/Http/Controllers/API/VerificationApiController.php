<?php

namespace App\Http\Controllers\API;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\User;
use Illuminate\Foundation\Auth\VerifiesEmails;
use Illuminate\Auth\Events\Verified;

class VerificationApiController extends Controller
{
    use VerifiesEmails;

    public function show()
    {
    //
    }

    /**
     * verifikasi email
    */
    public function verify(Request $request) {

        $userID = $request['id'];
        $user   = User::findOrFail($userID);
        $date   = date('Y-m-d g:i:s');
        
        $user->email_verified_at = $date; 
        $user->save();

        return response()->json([
            'success' => true,
            'status' => 200,
            'data'=> 'Email verified!'
        ]);

    }

    /**
    *resend email verification
    */
    public function resend(Request $request)
    {
        if ($request->user()->hasVerifiedEmail()) {

            return response()->json([
                'success' => true,
                'status' => 401,
                'data'=> 'User already have verified email!'
            ]);

        }

        $request->user()->sendEmailVerificationNotification();
        return response()->json([
            'success' => true,
            'status' => 200,
            'data'=> 'The notification has been resubmitted'
        ]);

    }
}
