@extends('storefront::public.layout')

@section('title', 'Contact Us | Mailee - Authentic Himalayan Delicacies')

@push('meta')
    <meta name="title" content="Contact Us | Mailee - Siliguri Central Kitchen & Support">
    <meta name="description" content="Get in touch with Mailee's central kitchen at ISKCON Mandir Road, Siliguri. Direct WhatsApp support, phone hotline +91 98008 64524, cold-chain delivery inquiries, and B2B wholesale supply.">
@endpush

@section('breadcrumb')
    <li class="active">Contact Us</li>
@endsection

@section('content')
<div class="mailee-contact-page">
    <!-- 1. Hero Header Banner -->
    <section class="contact-hero-section text-center">
        <div class="container">
            <span class="contact-badge">
                <i class="las la-headset"></i> SILIGURI CENTRAL KITCHEN & SUPPORT
            </span>
            <h1 class="contact-hero-title">
                We're Here to Help You Feast
            </h1>
            <p class="contact-hero-subtitle">
                Have questions regarding your cold-chain order, custom party combos, bulk HoReCa catering, or the ₹10 VIP Pass? Connect directly with our Siliguri kitchen and logistics team.
            </p>
        </div>
    </section>

    <!-- 2. Four Interactive Direct Action Cards -->
    <section class="contact-cards-section py-4">
        <div class="container">
            <div class="row g-3">
                <!-- WhatsApp Desk -->
                <div class="col-xl-4 col-lg-4 col-md-9 col-18">
                    <div class="contact-action-card card-wa">
                        <div class="card-icon-wrap wa-icon">
                            <i class="lab la-whatsapp"></i>
                        </div>
                        <div class="card-body-text">
                            <span class="card-tag">FASTEST RESPONSE</span>
                            <h3 class="card-heading">WhatsApp Support</h3>
                            <p class="card-desc">Chat directly with our dispatch manager in under 15 minutes.</p>
                            <a href="https://wa.me/919800864524?text=Hi%20Mailee%2C%20I%20have%20an%20inquiry%20regarding%20an%20order%20or%20products" target="_blank" class="card-action-link wa-link">
                                <span>Chat +91 98008 64524</span>
                                <i class="las la-external-link-alt"></i>
                            </a>
                        </div>
                    </div>
                </div>

                <!-- Phone Hotline -->
                <div class="col-xl-4 col-lg-4 col-md-9 col-18">
                    <div class="contact-action-card card-phone">
                        <div class="card-icon-wrap phone-icon">
                            <i class="las la-phone-volume"></i>
                        </div>
                        <div class="card-body-text">
                            <span class="card-tag">DIRECT CALL</span>
                            <h3 class="card-heading">Kitchen Hotline</h3>
                            <p class="card-desc">Call our Siliguri office directly for urgent order assistance.</p>
                            <a href="tel:+919800864524" class="card-action-link phone-link">
                                <span>+91 98008 64524</span>
                                <i class="las la-arrow-right"></i>
                            </a>
                        </div>
                    </div>
                </div>

                <!-- Email Desk -->
                <div class="col-xl-5 col-lg-5 col-md-9 col-18">
                    <div class="contact-action-card card-email">
                        <div class="card-icon-wrap email-icon">
                            <i class="las la-envelope-open-text"></i>
                        </div>
                        <div class="card-body-text">
                            <span class="card-tag">OFFICIAL EMAIL</span>
                            <h3 class="card-heading">Customer & Bulk Desk</h3>
                            <p class="card-desc">For institutional orders, feedback, or corporate inquiries.</p>
                            <a href="mailto:info@mailee.in" class="card-action-link email-link">
                                <span>info@mailee.in</span>
                                <i class="las la-arrow-right"></i>
                            </a>
                        </div>
                    </div>
                </div>

                <!-- Kitchen HQ Address -->
                <div class="col-xl-5 col-lg-5 col-md-9 col-18">
                    <div class="contact-action-card card-location">
                        <div class="card-icon-wrap location-icon">
                            <i class="las la-map-marked-alt"></i>
                        </div>
                        <div class="card-body-text">
                            <span class="card-tag">CENTRAL KITCHEN & HQ</span>
                            <h3 class="card-heading">Siliguri Facility</h3>
                            <p class="card-desc">Sachitra Complex, ISKCON Mandir Road, Siliguri 734001</p>
                            <a href="https://maps.google.com/?q=Sachitra+Complex+ISKCON+Mandir+Road+Siliguri+West+Bengal" target="_blank" class="card-action-link location-link">
                                <span>View on Google Maps</span>
                                <i class="las la-directions"></i>
                            </a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <!-- 3. Main Form + Operation Details Grid -->
    <section class="contact-main-section py-5">
        <div class="container">
            <div class="row g-4">
                <!-- Left: Modern Contact Form -->
                <div class="col-lg-10 col-md-18">
                    <div class="contact-form-glass-card shadow-sm">
                        <div class="form-header mb-4">
                            <span class="form-kicker">DIRECT MESSAGE</span>
                            <h2 class="form-title">Send Us an Inquiry</h2>
                            <p class="form-subtext">Fill out the form below and our kitchen support team will reply within 2 to 4 business hours.</p>
                        </div>

                        @if (session()->has('success'))
                            <div class="alert alert-success d-flex align-items-center mb-4" role="alert" style="border-radius: 8px; font-weight: 500;">
                                <i class="las la-check-circle fs-4 me-2"></i>
                                <div>{{ session('success') }}</div>
                            </div>
                        @endif

                        <form method="POST" action="{{ route('contact.store') }}" class="mailee-inquiry-form">
                            @csrf
                            @honeypot

                            <div class="row g-3">
                                <!-- Email -->
                                <div class="col-md-9 col-18">
                                    <div class="form-group mb-3">
                                        <label for="email" class="form-label">
                                            Your Email Address <span class="text-danger">*</span>
                                        </label>
                                        <div class="input-with-icon">
                                            <i class="las la-envelope input-icon"></i>
                                            <input 
                                                type="email" 
                                                name="email" 
                                                id="email" 
                                                value="{{ old('email') }}" 
                                                class="form-control @error('email') is-invalid @enderror" 
                                                placeholder="e.g. rahul@gmail.com"
                                                required
                                            >
                                        </div>
                                        @error('email')
                                            <span class="text-danger small mt-1 d-block">{{ $message }}</span>
                                        @enderror
                                    </div>
                                </div>

                                <!-- Subject / Topic -->
                                <div class="col-md-9 col-18">
                                    <div class="form-group mb-3">
                                        <label for="subject" class="form-label">
                                            Inquiry Category <span class="text-danger">*</span>
                                        </label>
                                        <div class="input-with-icon">
                                            <i class="las la-tag input-icon"></i>
                                            <select name="subject" id="subject" class="form-control form-select @error('subject') is-invalid @enderror" required>
                                                <option value="" disabled {{ old('subject') ? '' : 'selected' }}>Select Topic</option>
                                                <option value="Customer Order Inquiry" {{ old('subject') == 'Customer Order Inquiry' ? 'selected' : '' }}>Customer Order Inquiry</option>
                                                <option value="Bulk / HoReCa Catering Supply" {{ old('subject') == 'Bulk / HoReCa Catering Supply' ? 'selected' : '' }}>Bulk / HoReCa Catering Supply</option>
                                                <option value="Mailee ₹10 VIP Membership" {{ old('subject') == 'Mailee ₹10 VIP Membership' ? 'selected' : '' }}>Mailee ₹10 VIP Membership</option>
                                                <option value="Distribution & Franchise Inquiry" {{ old('subject') == 'Distribution & Franchise Inquiry' ? 'selected' : '' }}>Distribution & Franchise Inquiry</option>
                                                <option value="Cold-Chain Delivery Tracking" {{ old('subject') == 'Cold-Chain Delivery Tracking' ? 'selected' : '' }}>Cold-Chain Delivery Tracking</option>
                                                <option value="General Feedback & Compliments" {{ old('subject') == 'General Feedback & Compliments' ? 'selected' : '' }}>General Feedback & Compliments</option>
                                            </select>
                                        </div>
                                        @error('subject')
                                            <span class="text-danger small mt-1 d-block">{{ $message }}</span>
                                        @enderror
                                    </div>
                                </div>

                                <!-- Message -->
                                <div class="col-18">
                                    <div class="form-group mb-4">
                                        <label for="message" class="form-label">
                                            Your Message <span class="text-danger">*</span>
                                        </label>
                                        <textarea 
                                            name="message" 
                                            id="message" 
                                            rows="5" 
                                            class="form-control @error('message') is-invalid @enderror" 
                                            placeholder="Write your message here... Include your phone number and order ID if applicable."
                                            required
                                        >{{ old('message') }}</textarea>
                                        @error('message')
                                            <span class="text-danger small mt-1 d-block">{{ $message }}</span>
                                        @enderror
                                    </div>
                                </div>

                                @if (setting('google_recaptcha_enabled'))
                                    <div class="col-18">
                                        <div class="form-group mb-3 captcha-field">
                                            <div class="g-recaptcha" data-sitekey="{{ setting('google_recaptcha_site_key') }}"></div>
                                            @error('g-recaptcha-response')
                                                <span class="text-danger small mt-1 d-block">{{ $message }}</span>
                                            @enderror
                                        </div>
                                    </div>
                                @endif

                                <div class="col-18">
                                    <button type="submit" class="btn btn-mailee-submit btn-lg w-100" data-loading>
                                        <i class="las la-paper-plane me-2"></i> Send Message Now
                                    </button>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>

                <!-- Right: Operational Schedule & Facility Map -->
                <div class="col-lg-8 col-md-18">
                    <div class="contact-sidebar">
                        <!-- Operational Schedule Box -->
                        <div class="sidebar-box hours-box mb-4">
                            <div class="box-icon"><i class="las la-clock"></i></div>
                            <div class="box-content">
                                <h4 class="box-title">Facility & Dispatch Schedule</h4>
                                <ul class="hours-list">
                                    <li>
                                        <span class="day">Kitchen Prepping & Cooking</span>
                                        <span class="time">7:00 AM – 9:00 PM</span>
                                    </li>
                                    <li>
                                        <span class="day">Cold-Chain Delivery Dispatch</span>
                                        <span class="time">10:00 AM – 8:00 PM</span>
                                    </li>
                                    <li>
                                        <span class="day">Customer Support (Calls & WhatsApp)</span>
                                        <span class="time">9:00 AM – 9:00 PM</span>
                                    </li>
                                </ul>
                            </div>
                        </div>

                        <!-- Delivery Network Coverage -->
                        <div class="sidebar-box coverage-box mb-4">
                            <div class="box-icon"><i class="las la-shipping-fast"></i></div>
                            <div class="box-content">
                                <h4 class="box-title">Temperature-Controlled Delivery Zones</h4>
                                <p class="small text-muted mb-2">Same-day express insulated cold-chain delivery currently serving:</p>
                                <div class="zone-tags">
                                    <span class="zone-badge">Siliguri City</span>
                                    <span class="zone-badge">Matigara</span>
                                    <span class="zone-badge">Pradhan Nagar</span>
                                    <span class="zone-badge">Sevoke Road</span>
                                    <span class="zone-badge">Bagdogra</span>
                                    <span class="zone-badge">Salugara</span>
                                    <span class="zone-badge">Shivmandir</span>
                                    <span class="zone-badge">Jalpaiguri Hub</span>
                                    <span class="zone-badge">Kurseong Hub</span>
                                </div>
                            </div>
                        </div>

                        <!-- Google Map Embed Card -->
                        <div class="sidebar-box map-box p-0 overflow-hidden shadow-sm">
                            <div class="map-container-frame">
                                <iframe
                                    width="100%"
                                    height="240"
                                    src="https://maps.google.com/maps?q=Sachitra%20Complex%2C%20ISKCON%20Mandir%20Road%2C%20Siliguri&t=&z=14&ie=UTF8&iwloc=&output=embed"
                                    frameborder="0"
                                    scrolling="no"
                                    marginheight="0"
                                    marginwidth="0"
                                    title="Mailee Central Kitchen Location"
                                    style="border: 0; display: block;"
                                    loading="lazy">
                                </iframe>
                            </div>
                            <div class="map-label-footer p-3 bg-white">
                                <div class="d-flex align-items-center justify-content-between">
                                    <div>
                                        <strong class="d-block text-dark" style="font-size: 0.95rem;">Mailee Central Kitchen</strong>
                                        <span class="text-muted small">Sachitra Complex, ISKCON Mandir Road</span>
                                    </div>
                                    <a href="https://maps.google.com/?q=Sachitra+Complex+ISKCON+Mandir+Road+Siliguri+West+Bengal" target="_blank" class="btn btn-sm btn-outline-success">
                                        Directions <i class="las la-arrow-right"></i>
                                    </a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <!-- 4. Helpful Customer FAQ Accordion -->
    <section class="contact-faq-section py-5 bg-light-creme">
        <div class="container">
            <div class="text-center mb-4">
                <span class="contact-badge">GOT QUESTIONS?</span>
                <h2 class="faq-section-title">Frequently Asked Questions</h2>
                <p class="text-muted">Everything you need to know about our Himalayan frozen foods and delivery</p>
            </div>

            <div class="row justify-content-center">
                <div class="col-lg-12 col-md-18">
                    <div class="accordion mailee-accordion" id="contactFaqAccordion">
                        <!-- FAQ 1 -->
                        <div class="accordion-item">
                            <h2 class="accordion-header" id="headingOne">
                                <button class="accordion-button" type="button" data-bs-toggle="collapse" data-bs-target="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
                                    <i class="las la-snowflake me-2 text-success fs-5"></i> How do the momos stay frozen during home delivery?
                                </button>
                            </h2>
                            <div id="collapseOne" class="accordion-collapse collapse show" aria-labelledby="headingOne" data-bs-parent="#contactFaqAccordion">
                                <div class="accordion-body">
                                    All orders are packed in heavy-duty food-grade insulated thermal sleeves packed with food-grade dry ice packs. This ensures the contents remain rock-solid at sub-zero temperatures throughout the delivery transit right until you transfer them to your home freezer.
                                </div>
                            </div>
                        </div>

                        <!-- FAQ 2 -->
                        <div class="accordion-item">
                            <h2 class="accordion-header" id="headingTwo">
                                <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo">
                                    <i class="las la-fire me-2 text-success fs-5"></i> Do I need to thaw the momos before steaming or frying?
                                </button>
                            </h2>
                            <div id="collapseTwo" class="accordion-collapse collapse" aria-labelledby="headingTwo" data-bs-parent="#contactFaqAccordion">
                                <div class="accordion-body">
                                    <strong>Never thaw!</strong> Always cook Mailee momos straight from frozen. Simply place them directly into a pre-heated steamer for 6 to 8 minutes, or pan-fry or air-fry directly. Thawing destroys the delicate skin texture and releases the trapped broth prematurely.
                                </div>
                            </div>
                        </div>

                        <!-- FAQ 3 -->
                        <div class="accordion-item">
                            <h2 class="accordion-header" id="headingThree">
                                <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseThree" aria-expanded="false" aria-controls="collapseThree">
                                    <i class="las la-truck me-2 text-success fs-5"></i> What is the minimum order for free cold-chain delivery?
                                </button>
                            </h2>
                            <div id="collapseThree" class="accordion-collapse collapse" aria-labelledby="headingThree" data-bs-parent="#contactFaqAccordion">
                                <div class="accordion-body">
                                    Standard orders qualify for FREE express cold-chain delivery on orders above ₹499 across Siliguri. If you are a <strong>Mailee VIP Club Member</strong> (which costs just ₹10 for lifetime access), your free delivery threshold is lowered to just ₹299!
                                </div>
                            </div>
                        </div>

                        <!-- FAQ 4 -->
                        <div class="accordion-item">
                            <h2 class="accordion-header" id="headingFour">
                                <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseFour" aria-expanded="false" aria-controls="collapseFour">
                                    <i class="las la-utensils me-2 text-success fs-5"></i> Can I order bulk quantities for a party, cafe, or catering event?
                                </button>
                            </h2>
                            <div id="collapseFour" class="accordion-collapse collapse" aria-labelledby="headingFour" data-bs-parent="#contactFaqAccordion">
                                <div class="accordion-body">
                                    Yes! We supply cafes, restaurants, cloud kitchens, and private birthday/wedding catering across North Bengal. You can reach out directly via our WhatsApp line (+91 98008 64524) or select "Bulk / HoReCa Catering Supply" in the inquiry form above for custom discounted trade pricing.
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
    @if (setting('google_recaptcha_enabled'))
        <script async src="https://www.google.com/recaptcha/api.js"></script>
    @endif
@endpush
