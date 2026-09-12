@extends('storefront::public.layout')

@section('title', setting('store_tagline'))

@section('content')
    @includeUnless(is_null($slider), 'storefront::public.home.sections.hero')

    @if (setting('storefront_trust_section_enabled', true))
        @include('storefront::public.home.sections.trust_certifications')
    @endif

    @if (setting('storefront_product_tabs_1_section_enabled'))
        @include('storefront::public.home.sections.product_tabs_one')
    @endif

    @if (setting('storefront_combos_section_enabled', true))
        @include('storefront::public.home.sections.combos_and_parties')
    @endif

    @if (setting('storefront_comparison_section_enabled', true))
        @include('storefront::public.home.sections.comparison')
    @endif

    @if (setting('storefront_founder_story_enabled', true))
        @include('storefront::public.home.sections.founder_story')
    @endif

    @if (setting('storefront_press_coverage_enabled', true))
        @include('storefront::public.home.sections.press_coverage')
    @endif

    @if (setting('storefront_testimonials_section_enabled', true))
        @include('storefront::public.home.sections.testimonials')
    @endif

    @if (setting('storefront_social_community_enabled', true))
        @include('storefront::public.home.sections.social_community')
    @endif
@endsection

@push('meta')
    <meta name="description" content="{{ setting('store_description') }}">
@endpush

@push('globals')
    @vite([
        'modules/Storefront/Resources/assets/public/sass/pages/home/main.scss',
        'modules/Storefront/Resources/assets/public/js/pages/home/main.js',
    ])
@endpush
