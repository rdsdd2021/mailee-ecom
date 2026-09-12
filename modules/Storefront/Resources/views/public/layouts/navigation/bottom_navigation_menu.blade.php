<!-- Sticky Floating Mini-Cart Checkout Strip (Reveals when items are added to cart) -->
<div
    class="mobile-sticky-checkout-strip d-lg-none"
    x-show="$store.cart.quantity > 0"
    x-cloak
    x-transition:enter="transition ease-out duration-250"
    x-transition:enter-start="opacity-0 transform translate-y-3"
    x-transition:enter-end="opacity-100 transform translate-y-0"
    x-transition:leave="transition ease-in duration-200"
    x-transition:leave-start="opacity-100 transform translate-y-0"
    x-transition:leave-end="opacity-0 transform translate-y-3"
>
    <div class="checkout-strip-content">
        <div class="checkout-strip-details">
            <div class="checkout-strip-badge">
                <span x-text="$store.cart.quantity"></span>
            </div>
            <div class="checkout-strip-text">
                <span class="checkout-strip-label" x-text="`${$store.cart.quantity} item${$store.cart.quantity > 1 ? 's' : ''} added`"></span>
                <span class="checkout-strip-subtotal" x-text="typeof formatCurrency === 'function' ? formatCurrency($store.cart.subTotal) : '₹' + $store.cart.subTotal"></span>
            </div>
        </div>
        <a href="{{ route('cart.index') }}" class="checkout-strip-action-btn">
            <span>Proceed to Cart</span>
            <svg width="18" height="18" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2.5" stroke-linecap="round" stroke-linejoin="round">
                <line x1="5" y1="12" x2="19" y2="12"></line>
                <polyline points="12 5 19 12 12 19"></polyline>
            </svg>
        </a>
    </div>
</div>

<!-- Modern High-Converting Mobile Bottom Navigation Bar -->
<section class="bottom-navigation-wrap d-lg-none">
    <div class="container-fluid px-2">
        <ul class="bottom-navigation-items">
            <!-- 1. Home -->
            <li>
                <a href="{{ route('home') }}" class="{{ request()->routeIs('home') ? 'active' : '' }}">
                    <div class="nav-icon-box">
                        <svg xmlns="http://www.w3.org/2000/svg" width="22" height="22" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.8" stroke-linecap="round" stroke-linejoin="round">
                            <path d="M3 9l9-7 9 7v11a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2z"></path>
                            <polyline points="9 22 9 12 15 12 15 22"></polyline>
                        </svg>
                    </div>
                    <span>{{ trans('storefront::layouts.home') }}</span>
                </a>
            </li>

            <!-- 2. Shop -->
            <li>
                <a href="{{ route('shop') }}" class="{{ (request()->routeIs('shop') || request()->routeIs('products.*') || request()->routeIs('categories.*')) ? 'active' : '' }}">
                    <div class="nav-icon-box">
                        <svg xmlns="http://www.w3.org/2000/svg" width="22" height="22" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.8" stroke-linecap="round" stroke-linejoin="round">
                            <path d="M6 2L3 6v14a2 2 0 0 0 2 2h14a2 2 0 0 0 2-2V6l-3-4z"></path>
                            <line x1="3" y1="6" x2="21" y2="6"></line>
                            <path d="M16 10a4 4 0 0 1-8 0"></path>
                        </svg>
                    </div>
                    <span>Shop</span>
                </a>
            </li>

            <!-- 3. Cart (with Live Alpine Count) -->
            <li>
                <a href="{{ route('cart.index') }}" class="bottom-navigation-cart {{ request()->routeIs('cart.index') ? 'active' : '' }}">
                    <div class="nav-icon-box position-relative">
                        <svg xmlns="http://www.w3.org/2000/svg" width="22" height="22" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.8" stroke-linecap="round" stroke-linejoin="round">
                            <circle cx="9" cy="21" r="1"></circle>
                            <circle cx="20" cy="21" r="1"></circle>
                            <path d="M1 1h4l2.68 13.39a2 2 0 0 0 2 1.61h9.72a2 2 0 0 0 2-1.61L23 6H6"></path>
                        </svg>
                        <span class="count" x-text="$store.cart.quantity" x-show="$store.cart.quantity > 0">{{ $cartQuantity }}</span>
                    </div>
                    <span>{{ trans('storefront::layouts.cart') }}</span>
                </a>
            </li>

            <!-- 3. Account / Profile (Only visible when logged in) -->
            @auth
                <li>
                    <a href="{{ route('account.dashboard.index') }}" class="{{ request()->routeIs('account.*') ? 'active' : '' }}">
                        <div class="nav-icon-box">
                            <svg xmlns="http://www.w3.org/2000/svg" width="22" height="22" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.8" stroke-linecap="round" stroke-linejoin="round">
                                <path d="M20 21v-2a4 4 0 0 0-4-4H8a4 4 0 0 0-4 4v2"></path>
                                <circle cx="12" cy="7" r="4"></circle>
                            </svg>
                        </div>
                        <span>{{ trans('storefront::layouts.account') }}</span>
                    </a>
                </li>
            @endauth
        </ul>
    </div>
</section>
