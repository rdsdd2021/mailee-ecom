<section class="navigation-wrap">
    <div class="container">
        <div class="navigation-inner">
            @include('storefront::public.layouts.navigation.category_menu')
            @include('storefront::public.layouts.navigation.primary_menu')

            <div class="navigation-right d-none d-lg-flex align-items-center ms-auto">
                <a href="{{ route('cart.index') }}" class="nav-sticky-cart-btn" @click.prevent="$store.layout.openSidebarCart($event)">
                    <svg width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                        <circle cx="9" cy="21" r="1"></circle>
                        <circle cx="20" cy="21" r="1"></circle>
                        <path d="M1 1h4l2.68 13.39a2 2 0 0 0 2 1.61h9.72a2 2 0 0 0 2-1.61L23 6H6"></path>
                    </svg>
                    <span>Cart</span>
                    <span class="count" x-text="$store.cart.quantity" x-show="$store.cart.quantity > 0">{{ $cartQuantity }}</span>
                </a>
            </div>
        </div>
    </div>
</section>

@include('storefront::public.layouts.navigation.bottom_navigation_menu')
