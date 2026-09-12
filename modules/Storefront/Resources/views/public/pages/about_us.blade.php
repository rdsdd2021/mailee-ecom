@extends('storefront::public.layout')

@section('title', 'About Us | Mailee - Authentic Himalayan Delicacies')

@push('meta')
    <meta name="title" content="About Us | Mailee - Authentic Himalayan Delicacies">
    <meta name="description" content="Discover Mailee's inspiring journey from Siliguri street carts to an IIM Calcutta incubated frozen food revolution. Handcrafting authentic Himalayan momos with -40°C cryogenic blast-freezing and empowering tea-garden women.">
    <meta property="og:title" content="About Mailee - Himalayan Food Revolution">
    <meta property="og:description" content="From humble Siliguri momo carts to an IIM-C incubated enterprise. Handcrafted authentic Himalayan momos, cryogenic freezing, women empowerment, and street animal welfare.">
    <meta property="og:image" content="{{ asset('storage/media/press_toi_iim_calcutta.jpg') }}">
@endpush

@section('breadcrumb')
    <li class="active">About Us</li>
@endsection

@section('content')
<div class="mailee-about-page">
    <!-- 1. Hero Storytelling Banner -->
    <section class="about-hero-section">
        <div class="container">
            <div class="about-hero-content text-center">
                <span class="about-badge">
                    <i class="las la-mountain"></i> BORN IN SILIGURI • HIMALAYAN FOOTHILLS
                </span>
                <h1 class="about-hero-title">
                    Sacred Mountain Heritage.<br>
                    <span>Sub-Zero Cryogenic Science.</span>
                </h1>
                <p class="about-hero-subtitle">
                    How an obsession with authentic Darjeeling street taste grew from modest momo carts into an <strong>IIM Calcutta-incubated</strong> food revolution — handcrafted by empowered tea-garden women and blast-frozen at -40°C for untouched mountain freshness.
                </p>

                <!-- 4 Impact Counters -->
                <div class="about-stats-grid">
                    <div class="stat-card">
                        <div class="stat-icon"><i class="las la-graduation-cap"></i></div>
                        <div class="stat-val">IIM-C</div>
                        <div class="stat-lbl">Incubated Enterprise</div>
                    </div>
                    <div class="stat-card">
                        <div class="stat-icon"><i class="las la-snowflake"></i></div>
                        <div class="stat-val">-40°C</div>
                        <div class="stat-lbl">Cryogenic Blast Freezing</div>
                    </div>
                    <div class="stat-card">
                        <div class="stat-icon"><i class="las la-female"></i></div>
                        <div class="stat-val">100%</div>
                        <div class="stat-lbl">Women-Led Artisans</div>
                    </div>
                    <div class="stat-card">
                        <div class="stat-icon"><i class="las la-paw"></i></div>
                        <div class="stat-val">100+</div>
                        <div class="stat-lbl">Street Animals Fed Daily</div>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <!-- 2. Chapter 1: The Mountain Origins -->
    <section class="about-chapter-section py-5">
        <div class="container">
            <div class="row align-items-center">
                <div class="col-lg-9 col-md-18 order-lg-1 order-2">
                    <div class="chapter-text pe-lg-4">
                        <span class="chapter-tag">CHAPTER 01</span>
                        <h2 class="chapter-title">The Street-Cart Awakening</h2>
                        <p class="chapter-lead">
                            Anyone who has stood at a foggy corner in Darjeeling, Kurseong, or Siliguri knows the sacred ritual: lifting a bamboo steamer lid, the plume of fragrant steam, and that first piping-hot bite bursting with savory mountain broth.
                        </p>
                        <p class="chapter-desc">
                            When our founders looked at modern supermarket freezers, they felt heartbroken. Industrial factory momos were dry, wrapped in thick leathery dough, packed with artificial preservatives, and stripped of genuine mountain soul.
                        </p>
                        <p class="chapter-desc">
                            We asked a daring question: <em>"Can we capture the exact, uncompromised juiciness of a Siliguri street-cart momo and preserve it so pure that anyone can steam it at home in just 6 minutes?"</em> That single obsession gave birth to <strong>Mailee</strong>.
                        </p>
                        <div class="quote-card">
                            <i class="las la-quote-left quote-icon"></i>
                            <p class="quote-text">
                                "Real momos don't need synthetic flavor enhancers or leathery thick skins. They need mountain spring herbs, fresh meats, hand-crimped edges, and the courage to refuse chemical shortcuts."
                            </p>
                            <span class="quote-author">— The Founders of Mailee</span>
                        </div>
                    </div>
                </div>
                <div class="col-lg-9 col-md-18 order-lg-2 order-1 mb-4 mb-lg-0">
                    <div class="chapter-visual-card">
                        <img src="{{ asset('storage/media/takeaway_bento_box.jpg') }}" alt="Siliguri Street Food Origins" class="img-fluid rounded-4 shadow-sm" onerror="this.src='{{ asset('storage/media/classic_chicken_momo.jpg') }}'">
                        <div class="visual-badge">
                            <i class="las la-map-marker-alt"></i> Siliguri, North Bengal
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <!-- 3. Chapter 2: The Cryogenic Blast-Freezing Science -->
    <section class="about-tech-section py-5">
        <div class="container">
            <div class="text-center mb-5">
                <span class="chapter-tag">CHAPTER 02</span>
                <h2 class="chapter-title">The Cryogenic Science: Why -40°C Changes Everything</h2>
                <p class="tech-subhead mx-auto">
                    Most frozen foods fail because of ordinary slow-freezing. Here is how Mailee's IQF sub-zero blast freezing locks in fresh-steamed juiciness.
                </p>
            </div>

            <div class="row g-4">
                <div class="col-lg-9 col-md-18">
                    <div class="tech-compare-card bad-card">
                        <div class="compare-header">
                            <span class="cross-icon"><i class="las la-times-circle"></i></span>
                            <h4>Standard Slow Freezing (-10°C to -15°C)</h4>
                        </div>
                        <ul class="compare-list">
                            <li><i class="las la-times text-danger"></i> <strong>Jagged Macro Ice Crystals:</strong> Water molecules freeze slowly, forming jagged needles that puncture the delicate momo wrapper.</li>
                            <li><i class="las la-times text-danger"></i> <strong>Dry, Leathery Fillings:</strong> When cooked, all natural meat juices and broth leak out into the steamer water.</li>
                            <li><i class="las la-times text-danger"></i> <strong>Heavy Preservatives:</strong> Factories dump sodium benzoates and artificial stabilizers to prevent spoilage.</li>
                        </ul>
                    </div>
                </div>

                <div class="col-lg-9 col-md-18">
                    <div class="tech-compare-card good-card">
                        <div class="compare-header">
                            <span class="check-icon"><i class="las la-check-circle"></i></span>
                            <h4>Mailee Cryogenic Flash Freezing (-40°C IQF)</h4>
                        </div>
                        <ul class="compare-list">
                            <li><i class="las la-check text-success"></i> <strong>Microscopic Crystal Freeze:</strong> Instantly flash-frozen in a high-velocity sub-zero tunnel within minutes.</li>
                            <li><i class="las la-check text-success"></i> <strong>100% Juicy Broth Lock:</strong> Cell walls remain completely intact — yielding a volcanic explosion of mountain broth on your first bite.</li>
                            <li><i class="las la-check text-success"></i> <strong>Pure Clean-Label:</strong> Zero chemical preservatives, zero MSG, and zero artificial colors. Nature's cold is the only preservative.</li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <!-- 4. Chapter 3: IIM Calcutta Incubation & National Recognition -->
    <section class="about-chapter-section py-5">
        <div class="container">
            <div class="row align-items-center">
                <div class="col-lg-9 col-md-18 mb-4 mb-lg-0">
                    <div class="chapter-visual-card shadow-lg">
                        <img src="{{ asset('storage/media/press_toi_iim_calcutta.jpg') }}" alt="Times of India - IIM Calcutta Incubation" class="img-fluid rounded-4" onerror="this.src='{{ asset('storage/media/press_times_of_india.jpg') }}'">
                        <div class="visual-caption">
                            <span class="source-tag">The Times of India</span>
                            <p class="caption-text">"Siliguri startup creates blast-frozen momos, bags IIM-C incubation"</p>
                        </div>
                    </div>
                </div>
                <div class="col-lg-9 col-md-18">
                    <div class="chapter-text ps-lg-4">
                        <span class="chapter-tag">CHAPTER 03</span>
                        <h2 class="chapter-title">Incubated at IIM Calcutta Innovation Park</h2>
                        <p class="chapter-lead">
                            What started as a grassroots kitchen movement earned institutional recognition from one of India's most prestigious management and enterprise hubs: <strong>IIM Calcutta Innovation Park</strong>.
                        </p>
                        <p class="chapter-desc">
                            Through rigorous evaluations, Mailee was recognized for solving a multi-decade food logistics challenge: engineering an authentic mountain cold-chain that connects Himalayan tea-garden farmers, women artisans, and consumers across urban centers.
                        </p>
                        <div class="impact-feature-box">
                            <div class="feature-item">
                                <i class="las la-shield-alt"></i>
                                <div>
                                    <h5>Institutional Food Tech Mentorship</h5>
                                    <p>Guided by senior food technologists to optimize shelf life without additives.</p>
                                </div>
                            </div>
                            <div class="feature-item">
                                <i class="las la-chart-line"></i>
                                <div>
                                    <h5>Scalable Cold-Chain Logistics</h5>
                                    <p>Building certified sub-zero delivery corridors throughout North Bengal and beyond.</p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <!-- 5. Chapter 4: Women Empowerment in North Bengal Tea Gardens -->
    <section class="about-chapter-section py-5 bg-tea-garden">
        <div class="container">
            <div class="row align-items-center">
                <div class="col-lg-9 col-md-18 order-lg-1 order-2">
                    <div class="chapter-text pe-lg-4">
                        <span class="chapter-tag">CHAPTER 04</span>
                        <h2 class="chapter-title">Dignity for North Bengal's Tea-Garden Women</h2>
                        <p class="chapter-lead">
                            When historic tea gardens across Dooars and the Terai region faced closures and distress, hundreds of local families and women lost their only livelihoods.
                        </p>
                        <p class="chapter-desc">
                            Rather than building a sterile, fully automated robotic factory, Mailee chose a human-centric path. We established an artisan training center, upskilling women from tea garden communities into certified culinary craftswomen.
                        </p>
                        <p class="chapter-desc">
                            Today, every Mailee momo is hand-crimped with precision by these proud women. They receive fair living wages, comprehensive healthcare coverage, and the dignity of independent financial strength.
                        </p>
                        <div class="award-banner">
                            <div class="award-icon"><i class="las la-trophy"></i></div>
                            <div>
                                <h5>Honoured on Zee Bangla • Egiye Bangla</h5>
                                <p>"Siliguri couple emerged as God's angel for closed tea garden workers."</p>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-lg-9 col-md-18 order-lg-2 order-1 mb-4 mb-lg-0">
                    <div class="chapter-visual-card shadow-lg">
                        <img src="{{ asset('storage/media/press_egiye_bangla_award.jpg') }}" alt="Zee Bangla Egiye Bangla State Award" class="img-fluid rounded-4">
                        <div class="visual-caption">
                            <span class="source-tag">Zee Bangla • Egiye Bangla</span>
                            <p class="caption-text">Honoured on state television for grassroots women empowerment and tea garden upliftment.</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <!-- 6. Chapter 5: Street Dog & Animal Welfare Initiative -->
    <section class="about-chapter-section py-5">
        <div class="container">
            <div class="row align-items-center">
                <div class="col-lg-9 col-md-18 mb-4 mb-lg-0">
                    <div class="chapter-visual-card shadow-lg">
                        <img src="{{ asset('storage/media/press_dog_welfare.jpg') }}" alt="Mailee Street Dog Welfare Drive" class="img-fluid rounded-4">
                        <div class="visual-caption">
                            <span class="source-tag">Community Animal Care</span>
                            <p class="caption-text">Daily feeding drives and veterinary rescue for over 100 community dogs across Siliguri.</p>
                        </div>
                    </div>
                </div>
                <div class="col-lg-9 col-md-18">
                    <div class="chapter-text ps-lg-4">
                        <span class="chapter-tag">CHAPTER 05</span>
                        <h2 class="chapter-title">Giving Back to the Voiceless</h2>
                        <p class="chapter-lead">
                            For us, feeding people is only half the mission. A food company with no soul cannot craft real food.
                        </p>
                        <p class="chapter-desc">
                            Since our first street cart opened, our founders initiated the <strong>Mailee Stray Animal Welfare Pledge</strong>. Every evening after kitchen operations, our team prepares fresh, protein-rich meals for over 100 community dogs roaming the streets and railway crossings of Siliguri.
                        </p>
                        <p class="chapter-desc">
                            We fund emergency veterinary rescues, anti-rabies vaccination drives, sterilization camps, and reflective night-safety collars so road accidents are minimized. 
                        </p>
                        <div class="quote-card pledge-card">
                            <i class="las la-heart quote-icon text-danger"></i>
                            <p class="quote-text">
                                "When you enjoy a plate of Mailee momos with your family, know that a portion of that joy directly feeds and rescues a stray animal on the streets of Siliguri."
                            </p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <!-- 7. Kitchen Standards & Hygiene Certifications -->
    <section class="about-standards-section py-5 bg-light-creme">
        <div class="container">
            <div class="text-center mb-5">
                <span class="chapter-tag">FACILITY & QUALITY</span>
                <h2 class="chapter-title">State-of-the-Art Kitchen & Food Safety</h2>
                <p class="tech-subhead mx-auto">
                    Operating out of our certified central kitchen at ISKCON Mandir Road, Siliguri, we combine artisanal culinary tradition with international food safety protocols.
                </p>
            </div>

            <div class="row g-4">
                <div class="col-lg-6 col-md-9 col-18">
                    <div class="standard-box">
                        <div class="standard-icon"><i class="las la-certificate"></i></div>
                        <h4>FSSAI Certified Facility</h4>
                        <p>100% compliant with Central Food Safety and Standards Authority of India hygiene guidelines.</p>
                    </div>
                </div>
                <div class="col-lg-6 col-md-9 col-18">
                    <div class="standard-box">
                        <div class="standard-icon"><i class="las la-thermometer-three-quarters"></i></div>
                        <h4>Strict -18°C Cold Chain</h4>
                        <p>Real-time continuous temperature monitoring from blast tunnel to customer freezers.</p>
                    </div>
                </div>
                <div class="col-lg-6 col-md-9 col-18">
                    <div class="standard-box">
                        <div class="standard-icon"><i class="las la-leaf"></i></div>
                        <h4>Zero Preservatives</h4>
                        <p>No MSG, no chemical stabilizers, and zero synthetic fillers. Only pure mountain ingredients.</p>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <!-- 8. Media & Press Recognition Ribbon -->
    <section class="about-press-section py-5">
        <div class="container">
            <div class="text-center mb-4">
                <span class="chapter-tag">AS SEEN ACROSS INDIA</span>
                <h3 class="press-title">National Press & Media Recognition</h3>
                <p class="text-muted">Documented by India's leading journalists, national dailies, and broadcast networks</p>
            </div>

            <div class="press-logo-row">
                <div class="press-item">
                    <span class="press-badge-name">THE TIMES OF INDIA</span>
                    <span class="press-caption">Siliguri startup bags IIM-C incubation</span>
                </div>
                <div class="press-item">
                    <span class="press-badge-name">THE STATESMAN</span>
                    <span class="press-caption">Himalayan cold-chain enterprise</span>
                </div>
                <div class="press-item">
                    <span class="press-badge-name">ANANDABAZAR PATRIKA</span>
                    <span class="press-caption">Siliguri's frozen momo revolution</span>
                </div>
                <div class="press-item">
                    <span class="press-badge-name">ZEE BANGLA</span>
                    <span class="press-caption">Egiye Bangla state honour</span>
                </div>
                <div class="press-item">
                    <span class="press-badge-name">DAINIK JAGRAN</span>
                    <span class="press-caption">Mountain taste & hygiene excellence</span>
                </div>
                <div class="press-item">
                    <span class="press-badge-name">SIKKIM EXPRESS</span>
                    <span class="press-caption">Darjeeling-Sikkim culinary corridor</span>
                </div>
            </div>
        </div>
    </section>

    <!-- 9. High-Converting Call to Action Banner -->
    <section class="about-cta-section py-5 text-center">
        <div class="container">
            <div class="cta-inner-card">
                <span class="cta-sparkle">🏔️ EXPERIENCE THE HIMALAYAN REVOLUTION</span>
                <h2 class="cta-headline">Taste Real Himalayan Momos Tonight</h2>
                <p class="cta-desc">
                    Stock your freezer with juicy 1Kg momo packs, flaky Malabar parathas, and mountain snacks. Free cold-chain delivery across Siliguri & North Bengal.
                </p>
                <div class="cta-actions">
                    <a href="{{ route('home') }}" class="btn btn-gold btn-lg">
                        <i class="las la-shopping-bag"></i> Explore Full Menu
                    </a>
                    <a href="{{ route('vip') }}" class="btn btn-outline-light btn-lg ms-sm-3">
                        <i class="las la-crown"></i> Get ₹10 VIP Wholesale Pass
                    </a>
                    <a href="{{ route('contact.create') }}" class="btn btn-outline-light btn-lg ms-sm-3">
                        <i class="las la-headset"></i> Contact Us
                    </a>
                </div>
            </div>
        </div>
    </section>
</div>
@endsection
