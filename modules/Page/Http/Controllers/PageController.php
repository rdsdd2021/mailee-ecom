<?php

namespace Modules\Page\Http\Controllers;

use Illuminate\Http\Response;
use Modules\Page\Entities\Page;
use Modules\Media\Entities\File;

class PageController
{
    /**
     * Display page for the slug.
     *
     * @param string $slug
     *
     * @return mixed
     */
    public function show($slug)
    {
        if ($slug === 'contact-us' || $slug === 'contact') {
            return redirect()->route('contact.create');
        }

        $logo = File::findOrNew(setting('storefront_header_logo'))->path;

        if ($slug === 'vip' || $slug === 'vip-membership' || $slug === 'vip-pass') {
            return view('storefront::public.pages.vip_membership', compact('logo'));
        }

        if ($slug === 'about-us' || $slug === 'about') {
            $page = Page::whereIn('slug', ['about-us', 'about'])->first();
            return view('storefront::public.pages.about_us', compact('page', 'logo'));
        }

        $page = Page::where('slug', $slug)->firstOrFail();

        $customView = 'storefront::public.pages.' . str_replace('-', '_', $slug);
        if (view()->exists($customView)) {
            return view($customView, compact('page', 'logo'));
        }

        return view('storefront::public.pages.show', compact('page', 'logo'));
    }

    /**
     * Display the dedicated VIP Membership Club page.
     *
     * @return mixed
     */
    public function vip()
    {
        $logo = File::findOrNew(setting('storefront_header_logo'))->path;

        return view('storefront::public.pages.vip_membership', compact('logo'));
    }
}
