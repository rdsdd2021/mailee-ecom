@extends('storefront::public.layout')

@section('title', $page->name)

@push('meta')
    <meta name="title" content="{{ $page->meta->meta_title ?: $page->name }}">
    <meta name="description" content="{{ $page->meta->meta_description }}">
    <meta name="twitter:card" content="summary">
    <meta property="og:url" content="{{ url()->current() }}">
    <meta property="og:title" content="{{ $page->meta->meta_title ?: $page->name }}">
    <meta property="og:description" content="{{ $page->meta->meta_description }}">
    <meta property="og:image" content="{{ $logo }}">
    <meta property="og:locale" content="{{ locale() }}">

    @foreach (supported_locale_keys() as $code)
        <meta property="og:locale:alternate" content="{{ $code }}">
    @endforeach
@endpush

@section('breadcrumb')
    <li class="active">{{ $page->name }}</li>
@endsection

@section('content') 
    <div class="custom-page-header" style="background: linear-gradient(135deg, #1b4d3e 0%, #0d2c23 100%); padding: 50px 0; color: #ffffff; text-align: center; margin-bottom: 40px;">
        <div class="container">
            <h1 style="font-size: 2.5rem; font-weight: 700; margin: 0 0 10px 0; color: #ffffff; letter-spacing: -0.5px;">{{ $page->name }}</h1>
            <p style="font-size: 1.1rem; color: #d0e7de; margin: 0; max-width: 600px; margin: 0 auto;">Authentic Himalayan & Nepali Frozen Foods in North Bengal</p>
        </div>
    </div>

    <section class="custom-page-wrap clearfix" style="padding-bottom: 60px;">
        <div class="container">
            <div class="custom-page-content clearfix" style="background: #ffffff; padding: 40px; border-radius: 12px; box-shadow: 0 4px 20px rgba(0,0,0,0.06); border: 1px solid #eef2f0;">
                {!! $page->body !!}
            </div>
        </div>
    </section>
@endsection

@push('globals')
    @vite([
        'modules/Storefront/Resources/assets/public/sass/pages/custom-page/main.scss',
    ])
@endpush