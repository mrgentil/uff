<?php

namespace App\Mail;

use Illuminate\Bus\Queueable;
use Illuminate\Contracts\Queue\ShouldQueue;
use Illuminate\Mail\Mailable;
use Illuminate\Queue\SerializesModels;

class ContactMail extends Mailable
{
    use Queueable, SerializesModels;
    public $name_complet;
    public $email;
    public $phone;
    public $contenu;


    /**
     * Create a new message instance.
     *
     * @return void
     */
    public function __construct($name_complet,$email,$phone,$contenu)
    {
        //
        $this->name_complet = $name_complet;
        $this->email = $email;
        $this->phone = $phone;
        $this->contenu = $contenu;
    }

    /**
     * Build the message.
     *
     * @return $this
     */
    public function build()
    {
        return $this->markdown('emails.contact.email',[
            'name_complet'=>$this->name_complet,
            'email' =>$this->email,
            'phone' =>$this->phone,
            'contenu' => $this->contenu,
        ]);
    }
}
