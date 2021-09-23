<?php

namespace App\Http\Controllers;

use App\Mail\ContactMail;
use App\Models\Contact;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Mail;
use Illuminate\Support\Facades\Validator;


class ContactController extends Controller
{



    public function store(Request $request)
    {
        $this->validate($request,[
            'name_complet' =>'required|string',
            'email' =>'sometimes|email',
            'phone' =>'required|string',
            'contenu' =>'required|string',
        ]);
        $contacts = New Contact();
        $contacts->name_complet=$request->name_complet;
        $contacts->email=$request->email;
        $contacts->phone=$request->phone;
        $contacts->contenu=$request->contenu;
        $contacts->save();
        if ($contacts->save() == true)
        {
            Mail::to('contact@uffrdc.org')->send(new ContactMail(
                $request->name_complet,
                $request->email,
                $request->phone,
                $request->contenu,
            ));
            flash('Merci de nous écrire ');

        }
        return redirect()->back();
    }
}
