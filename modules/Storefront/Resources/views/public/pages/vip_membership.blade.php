@extends('storefront::public.layout')

@section('title', '₹10 VIP Club Membership | Mailee Wholesale Access')

@push('meta')
    <meta name="title" content="Mailee ₹10 VIP Wholesale Pass | 10% Lifetime Discount">
    <meta name="description" content="Unlock Himalayan Wholesale Club prices for just ₹10. Enjoy flat 10% lifetime discount on all momos, parathas and snacks, lower free cold delivery thresholds, and secret tasting room perks.">
    <meta property="og:title" content="Mailee ₹10 VIP Wholesale Pass">
    <meta property="og:description" content="Pay ₹10 once for lifetime VIP access. 10% off every order, free priority delivery, and VIP perks.">
    <meta property="og:image" content="{{ asset('storage/media/membership.png') }}">
@endpush

@section('breadcrumb')
    <li class="active">₹10 VIP Wholesale Pass</li>
@endsection

@section('content')
<div class="mailee-vip-page">
    <!-- 1. Luxury Gold & Emerald Hero Section -->
    <section class="vip-hero-section py-5">
        <div class="container">
            <div class="row align-items-center">
                <div class="col-lg-10 col-md-18 order-lg-1 order-2">
                    <div class="vip-hero-text">
                        <div class="vip-crown-badge">
                            <i class="las la-crown"></i> HIMALAYAN WHOLESALE CLUB
                        </div>
                        <h1 class="vip-hero-title">
                            Unlock Wholesale Pricing<br>
                            <span>For Just ₹10 Lifetime</span>
                        </h1>
                        <p class="vip-hero-sub">
                            Why pay full retail when you can buy at insider wholesale rates? Pay just <strong>₹10 once</strong> to activate lifetime VIP status — saving you 10% on every momo pack, paratha, and snack box you ever order.
                        </p>

                        <!-- Hero Feature Pills -->
                        <div class="vip-feature-pills">
                            <span class="vip-pill-item"><i class="las la-check-circle text-warning"></i> 10% Flat Lifetime OFF</span>
                            <span class="vip-pill-item"><i class="las la-check-circle text-warning"></i> Free Delivery Over ₹299</span>
                            <span class="vip-pill-item"><i class="las la-check-circle text-warning"></i> No Renewal Fees Ever</span>
                        </div>

                        <!-- Hero CTA Bar -->
                        <div class="vip-hero-actions mt-4">
                            <a href="#claim-vip-pass" class="btn btn-gold btn-lg shadow-lg">
                                <i class="las la-gem me-2"></i> Claim ₹10 VIP Pass Now
                            </a>
                            <a href="https://wa.me/919800864524?text=Hi%20Mailee%2C%20I%20want%20to%20activate%20my%20%E2%82%B910%20VIP%20Wholesale%20Pass" target="_blank" class="btn btn-outline-light btn-lg ms-sm-3 mt-2 mt-sm-0">
                                <i class="lab la-whatsapp me-2"></i> Activate via WhatsApp
                            </a>
                        </div>
                    </div>
                </div>

                <!-- 3D Holographic VIP Card Visual -->
                <div class="col-lg-8 col-md-18 order-lg-2 order-1 mb-4 mb-lg-0 text-center">
                    <div class="vip-card-3d-wrap">
                        <div class="vip-card-metal shadow-2xl">
                            <div class="card-chip-row">
                                <div class="card-chip"></div>
                                <div class="card-gold-seal">
                                    <i class="las la-award text-warning"></i> VERIFIED VIP
                                </div>
                            </div>
                            <div class="card-brand-row">
                                <span class="card-brand-name">MAILEE</span>
                                <span class="card-sub-brand">HIMALAYAN CLUB</span>
                            </div>
                            <div class="card-tier-label">
                                LIFETIME WHOLESALE ACCESS
                            </div>
                            <div class="card-bottom-row">
                                <div class="card-holder-info">
                                    <span class="holder-label">MEMBERSHIP PASS</span>
                                    <span class="holder-val">SPECIAL INTRO PASS</span>
                                </div>
                                <div class="card-cost-stamp">
                                    <span class="fee-label">ONLY</span>
                                    <span class="fee-amt">₹10</span>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <!-- 2. The 6 Exclusive VIP Perks -->
    <section class="vip-perks-section py-5 bg-white">
        <div class="container">
            <div class="text-center mb-5">
                <span class="vip-kicker">MEMBER PRIVILEGES</span>
                <h2 class="vip-section-title">What You Get With Your ₹10 Pass</h2>
                <p class="text-muted mx-auto" style="max-width: 600px;">Every single order becomes more affordable. Here is everything unlocked the second you join.</p>
            </div>

            <div class="row g-4">
                <!-- Perk 1 -->
                <div class="col-lg-6 col-md-9 col-18">
                    <div class="vip-perk-card">
                        <div class="perk-icon-circle"><i class="las la-percent"></i></div>
                        <h4 class="perk-title">10% Flat Lifetime Discount</h4>
                        <p class="perk-desc">Save 10% automatically on all 1Kg momo packs, Malabar parathas, kebabs, and party snacks. Every day, forever.</p>
                    </div>
                </div>

                <!-- Perk 2 -->
                <div class="col-lg-6 col-md-9 col-18">
                    <div class="vip-perk-card">
                        <div class="perk-icon-circle"><i class="las la-shipping-fast"></i></div>
                        <h4 class="perk-title">Lower Free Delivery (₹299)</h4>
                        <p class="perk-desc">Standard free delivery threshold is ₹499. For VIP members, get free insulated cold-chain delivery on orders over just ₹299!</p>
                    </div>
                </div>

                <!-- Perk 3 -->
                <div class="col-lg-6 col-md-9 col-18">
                    <div class="vip-perk-card">
                        <div class="perk-icon-circle"><i class="las la-utensils"></i></div>
                        <h4 class="perk-title">Secret Tasting Kitchen</h4>
                        <p class="perk-desc">Receive exclusive invitations to sample upcoming chef test recipes (like Smoked Tingmo & Schezwan Momos) before public launch.</p>
                    </div>
                </div>

                <!-- Perk 4 -->
                <div class="col-lg-6 col-md-9 col-18">
                    <div class="vip-perk-card">
                        <div class="perk-icon-circle"><i class="lab la-whatsapp"></i></div>
                        <h4 class="perk-title">VIP WhatsApp Concierge</h4>
                        <p class="perk-desc">Direct priority line to our Siliguri kitchen manager for customized party boxes, urgent dispatch, and special events.</p>
                    </div>
                </div>

                <!-- Perk 5 -->
                <div class="col-lg-6 col-md-9 col-18">
                    <div class="vip-perk-card">
                        <div class="perk-icon-circle"><i class="las la-birthday-cake"></i></div>
                        <h4 class="perk-title">Birthday Delicacy Surprise</h4>
                        <p class="perk-desc">Enjoy a complimentary box of Himalayan sweet buns or artisanal snacks delivered with your birthday week order.</p>
                    </div>
                </div>

                <!-- Perk 6 -->
                <div class="col-lg-6 col-md-9 col-18">
                    <div class="vip-perk-card">
                        <div class="perk-icon-circle"><i class="las la-infinity"></i></div>
                        <h4 class="perk-title">Zero Hidden Renewals</h4>
                        <p class="perk-desc">No annual renewal charges. No surprise monthly subscriptions. Pay ₹10 once and enjoy VIP wholesale privileges for life.</p>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <!-- 3. Real Math: Compare & Save Table -->
    <section class="vip-compare-section py-5 bg-creme">
        <div class="container">
            <div class="text-center mb-5">
                <span class="vip-kicker">INSTANT RETURN ON INVESTMENT</span>
                <h2 class="vip-section-title">The Math Speaks for Itself</h2>
                <p class="text-muted mx-auto" style="max-width: 600px;">See how the ₹10 pass pays for itself over 5 times on your very first order.</p>
            </div>

            <div class="row justify-content-center">
                <div class="col-lg-12 col-md-18">
                    <div class="table-responsive shadow-sm rounded-4 overflow-hidden">
                        <table class="table vip-comparison-table mb-0">
                            <thead>
                                <tr>
                                    <th style="width: 44%;">Sample Typical Order</th>
                                    <th class="text-center text-muted" style="width: 28%;">Standard Guest</th>
                                    <th class="text-center bg-gold-header" style="width: 28%;">
                                        <i class="las la-crown text-warning"></i> Mailee VIP Member
                                    </th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td>
                                        <strong>1Kg Classic Chicken Momos</strong>
                                        <span class="d-block small text-muted">~40 Handcrafted Juicy Momos</span>
                                    </td>
                                    <td class="text-center">₹320</td>
                                    <td class="text-center fw-bold text-success bg-gold-cell">₹288</td>
                                </tr>
                                <tr>
                                    <td>
                                        <strong>1Kg Flaky Malabar Parathas</strong>
                                        <span class="d-block small text-muted">Layered Mountain Breads</span>
                                    </td>
                                    <td class="text-center">₹260</td>
                                    <td class="text-center fw-bold text-success bg-gold-cell">₹234</td>
                                </tr>
                                <tr>
                                    <td>
                                        <strong>Cold-Chain Insulated Delivery</strong>
                                        <span class="d-block small text-muted">Delivery fee for orders &lt; ₹499</span>
                                    </td>
                                    <td class="text-center">₹50</td>
                                    <td class="text-center fw-bold text-success bg-gold-cell">FREE (Over ₹299)</td>
                                </tr>
                                <tr class="total-row">
                                    <td><strong>Order Total:</strong></td>
                                    <td class="text-center text-decoration-line-through text-muted">₹630</td>
                                    <td class="text-center fw-bold text-success bg-gold-cell" style="font-size: 1.25rem;">
                                        ₹522
                                    </td>
                                </tr>
                                <tr class="savings-row">
                                    <td colspan="3" class="text-center py-3">
                                        <span class="badge-instant-savings">
                                            🎉 YOU SAVE ₹108 ON DAY ONE — 10.8X THE COST OF YOUR ₹10 PASS!
                                        </span>
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <!-- 4. Interactive 1-Click Purchase Action Card -->
    <section class="vip-checkout-action-section py-5" id="claim-vip-pass">
        <div class="container">
            <div class="row justify-content-center">
                <div class="col-lg-10 col-md-16 col-18">
                    <div class="vip-action-card shadow-2xl">
                        <div class="action-card-badge">
                            🔥 SPECIAL INTRODUCTORY OFFER
                        </div>
                        <h3 class="action-title">Get Lifetime VIP Access</h3>
                        <p class="action-sub">Activate your account instantly and apply wholesale prices today.</p>

                        <div class="price-display-box my-4">
                            <span class="old-price">₹999</span>
                            <span class="current-price">₹10</span>
                            <span class="save-tag">SAVE 99%</span>
                        </div>

                        <!-- 1-Click Buy Form -->
                        <div class="action-button-group">
                            <!-- Direct Add to Cart Action -->
                            <form method="POST" action="{{ route('cart.items.store') }}" class="w-100 mb-3" id="vipPassForm">
                                @csrf
                                <input type="hidden" name="product_id" value="68">
                                <input type="hidden" name="qty" value="1">
                                <button type="submit" class="btn btn-gold btn-xl w-100 py-3 shadow-lg fw-bold" id="vipSubmitBtn">
                                    <i class="las la-shopping-cart fs-5 me-2"></i> Add VIP Pass to Cart (₹10)
                                </button>
                            </form>

                            <!-- Direct Product Page Link Fallback -->
                            <div class="text-center mb-3">
                                <a href="/products/mailee-rs10-vip-club-membership-pass" class="text-muted small text-decoration-underline">
                                    Or view full product details page
                                </a>
                            </div>

                            <!-- WhatsApp 1-Tap Alternative -->
                            <div class="divider-text my-3">
                                <span>OR ACTIVATE VIA WHATSAPP</span>
                            </div>

                            <a href="https://wa.me/919800864524?text=Hi%20Mailee%2C%20I%20want%20to%20activate%20my%20%E2%82%B910%20VIP%20Wholesale%20Club%20Pass%20now." target="_blank" class="btn btn-whatsapp-vip w-100 py-2">
                                <i class="lab la-whatsapp fs-5 me-2"></i> Quick Order VIP Pass on WhatsApp
                            </a>
                        </div>

                        <div class="vip-security-strip mt-4 pt-3 border-top">
                            <span class="sec-item"><i class="las la-shield-alt text-success"></i> 100% Secure Checkout</span>
                            <span class="sec-item"><i class="las la-bolt text-warning"></i> Instant Activation</span>
                            <span class="sec-item"><i class="las la-undo text-primary"></i> 100% Risk Free</span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <!-- 5. Member Reviews / Social Proof -->
    <section class="vip-reviews-section py-5 bg-white">
        <div class="container">
            <div class="text-center mb-5">
                <span class="vip-kicker">COMMUNITY LOVE</span>
                <h2 class="vip-section-title">What VIP Members in North Bengal Say</h2>
            </div>

            <div class="row g-4">
                <div class="col-lg-6 col-md-9 col-18">
                    <div class="review-box">
                        <div class="stars mb-2">⭐⭐⭐⭐⭐</div>
                        <p class="review-comment">
                            "The ₹10 pass is the best investment I ever made for weekend snacks. I ordered 2kg chicken momos and saved ₹64 on my first order. Truly restaurant quality right in my freezer."
                        </p>
                        <div class="reviewer-meta">
                            <strong>Anirban S.</strong>
                            <span class="text-muted small d-block">Pradhan Nagar, Siliguri</span>
                        </div>
                    </div>
                </div>

                <div class="col-lg-6 col-md-9 col-18">
                    <div class="review-box">
                        <div class="stars mb-2">⭐⭐⭐⭐⭐</div>
                        <p class="review-comment">
                            "As a college student living away from home, having authentic Darjeeling momos ready in 6 minutes is a lifesaver. The VIP free delivery at ₹299 is super convenient."
                        </p>
                        <div class="reviewer-meta">
                            <strong>Pooja Tamang</strong>
                            <span class="text-muted small d-block">Shivmandir, Siliguri</span>
                        </div>
                    </div>
                </div>

                <div class="col-lg-6 col-md-9 col-18">
                    <div class="review-box">
                        <div class="stars mb-2">⭐⭐⭐⭐⭐</div>
                        <p class="review-comment">
                            "We run a boutique cafe near Sevoke Road and buy their parathas and cheese chicken momos regularly. The 10% wholesale discount saves us thousands every month."
                        </p>
                        <div class="reviewer-meta">
                            <strong>Debabrata M.</strong>
                            <span class="text-muted small d-block">Cafe Owner, Sevoke Road</span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <!-- 6. VIP FAQ Accordion -->
    <section class="vip-faq-section py-5 bg-creme">
        <div class="container">
            <div class="text-center mb-4">
                <span class="vip-kicker">QUESTIONS & ANSWERS</span>
                <h2 class="vip-section-title">VIP Membership FAQs</h2>
            </div>

            <div class="row justify-content-center">
                <div class="col-lg-12 col-md-18">
                    <div class="accordion mailee-accordion" id="vipFaqAccordion">
                        <div class="accordion-item">
                            <h2 class="accordion-header" id="vipHeadingOne">
                                <button class="accordion-button" type="button" data-bs-toggle="collapse" data-bs-target="#vipCollapseOne" aria-expanded="true" aria-controls="vipCollapseOne">
                                    <i class="las la-question-circle me-2 text-warning fs-5"></i> How is the VIP Pass only ₹10? Is there a catch?
                                </button>
                            </h2>
                            <div id="vipCollapseOne" class="accordion-collapse collapse show" aria-labelledby="vipHeadingOne" data-bs-parent="#vipFaqAccordion">
                                <div class="accordion-body">
                                    No catch at all! Our mission is to make authentic Himalayan frozen foods accessible to every household in North Bengal. The ₹10 charge is a nominal token fee to register your account into our VIP Wholesale Club and issue your lifetime pass.
                                </div>
                            </div>
                        </div>

                        <div class="accordion-item">
                            <h2 class="accordion-header" id="vipHeadingTwo">
                                <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#vipCollapseTwo" aria-expanded="false" aria-controls="vipCollapseTwo">
                                    <i class="las la-cart-plus me-2 text-warning fs-5"></i> Can I add momos and the VIP pass in the same cart?
                                </button>
                            </h2>
                            <div id="vipCollapseTwo" class="accordion-collapse collapse" aria-labelledby="vipHeadingTwo" data-bs-parent="#vipFaqAccordion">
                                <div class="accordion-body">
                                    Yes! You can add any momo packs, parathas, or party combos to your cart along with the ₹10 VIP Pass, and proceed to checkout together.
                                </div>
                            </div>
                        </div>

                        <div class="accordion-item">
                            <h2 class="accordion-header" id="vipHeadingThree">
                                <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#vipCollapseThree" aria-expanded="false" aria-controls="vipCollapseThree">
                                    <i class="las la-infinity me-2 text-warning fs-5"></i> Does the VIP Pass ever expire?
                                </button>
                            </h2>
                            <div id="vipCollapseThree" class="accordion-collapse collapse" aria-labelledby="vipHeadingThree" data-bs-parent="#vipFaqAccordion">
                                <div class="accordion-body">
                                    No. Your VIP Pass is valid for lifetime. Once linked to your mobile number or account, you will permanently enjoy member pricing.
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
</div>
@endsection

@push('scripts')
<script>
    document.addEventListener('DOMContentLoaded', function() {
        const vipForm = document.getElementById('vipPassForm');
        const vipBtn = document.getElementById('vipSubmitBtn');
        if (vipForm && vipBtn) {
            vipForm.addEventListener('submit', function() {
                vipBtn.disabled = true;
                vipBtn.innerHTML = '<span class="spinner-border spinner-border-sm me-2" role="status" aria-hidden="true"></span> Adding VIP Pass...';
            });
        }
    });
</script>
@endpush
