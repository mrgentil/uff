@component('mail::message')
    # Contact


    Nom  Complet :
    {{ $name_complet }}



    Email :
    {{ $email }}

    Téléphone :
    {{$phone}}


    Contenu du message :
    {!! nl2br(e($contenu)) !!}

    Merci,
    {{ config('app.name') }}
@endcomponent
