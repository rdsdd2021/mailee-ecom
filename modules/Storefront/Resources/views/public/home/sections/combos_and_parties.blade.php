<section id="combos-section" class="combos-wrap py-5 my-4" style="background: #f8fafc; border-top: 1px solid #e2e8f0; border-bottom: 1px solid #e2e8f0;">
    <div class="container">
        <div class="d-flex justify-content-between align-items-end mb-4 flex-wrap gap-2">
            <div>
                <span class="badge px-3 py-2 rounded-pill fw-bold text-uppercase" style="background: #eef7f2; color: #0d8a4a; letter-spacing: 1px; font-size: 0.75rem;">
                    Bigger Savings & Easy Entertaining
                </span>
                <h2 class="fw-bold mt-2 mb-0" style="font-size: 2.1rem; letter-spacing: -0.5px; color: #0c2b20 !important;">
                    Curated Combos & Party Boxes
                </h2>
            </div>
            <a href="{{ route('products.index') }}" class="btn rounded-pill px-4 py-2 fw-bold text-white shadow-sm" style="background: #0c2b20; font-size: 0.88rem;">
                View All Combos →
            </a>
        </div>

        <div class="row g-4">
            <!-- Combo 1 (9 of 18 columns = 50%) -->
            <div class="col-lg-9 col-md-18 col-18">
                <div class="card border-0 rounded-4 shadow-md overflow-hidden h-100 text-white" 
                     style="background: linear-gradient(135deg, #0c2b20 0%, #154131 100%); border: 1.5px solid #d97706 !important;">
                    <div class="d-flex flex-column flex-sm-row h-100 align-items-center">
                        <div class="p-4 d-flex flex-column justify-content-between h-100 flex-grow-1" style="min-width: 0;">
                            <div>
                                <span class="badge fw-bold px-3 py-1 rounded-pill mb-2" style="background: #d97706; color: #ffffff;">
                                    🔥 MOST POPULAR COMBO
                                </span>
                                <h3 class="fw-bold text-white mb-2" style="font-size: 1.35rem;">
                                    Siliguri Evening Chai-Snack Box
                                </h3>
                                <p class="text-white-50 small mb-3" style="line-height: 1.5;">
                                    15 Steamed Chicken Momos + 5 Veg Spring Rolls + 3 Flaky Laccha Parathas + Signature Dalle Chutney.
                                </p>
                            </div>
                            <div class="d-flex align-items-center justify-content-between flex-wrap gap-2 pt-3 border-top border-white border-opacity-15">
                                <div>
                                    <span class="fs-3 fw-bold" style="color: #fef08a;">₹349</span>
                                    <span class="text-decoration-line-through text-white-50 ms-2 small">₹480</span>
                                    <span class="badge bg-danger ms-2 px-2 py-1 small rounded-pill">-27%</span>
                                </div>
                                <a href="{{ route('products.index') }}" class="btn rounded-pill px-4 fw-bold shadow-sm" style="background: #f59e0b; color: #0c2b20;">
                                    🛒 Order Box
                                </a>
                            </div>
                        </div>
                        <div class="p-3 text-center flex-shrink-0" style="width: 200px; max-width: 100%;">
                            <img src="{{ asset('storage/media/takeaway_bento_box.jpg') }}" 
                                 alt="Siliguri Evening Chai-Snack Box" 
                                 class="img-fluid rounded-4 shadow-sm w-100" 
                                 style="height: 170px; object-fit: cover; border: 1px solid rgba(255,255,255,0.2);">
                        </div>
                    </div>
                </div>
            </div>

            <!-- Combo 2 (9 of 18 columns = 50%) -->
            <div class="col-lg-9 col-md-18 col-18">
                <div class="card border-0 rounded-4 shadow-md overflow-hidden h-100 text-white" 
                     style="background: linear-gradient(135deg, #7c1a0a 0%, #4a0c02 100%); border: 1.5px solid #f59e0b !important;">
                    <div class="d-flex flex-column flex-sm-row h-100 align-items-center">
                        <div class="p-4 d-flex flex-column justify-content-between h-100 flex-grow-1" style="min-width: 0;">
                            <div>
                                <span class="badge fw-bold px-3 py-1 rounded-pill mb-2" style="background: #f59e0b; color: #4a0c02;">
                                    🎉 WEEKEND GATHERINGS
                                </span>
                                <h3 class="fw-bold text-white mb-2" style="font-size: 1.35rem;">
                                    Himalayan Feast Mega Party Platter
                                </h3>
                                <p class="text-white-50 small mb-3" style="line-height: 1.5;">
                                    24 Darjeeling Chicken Momos + 20 Gourmet Cheese Momos + 16 Fiery Tandoori Momos + 3 Artisan Dips.
                                </p>
                            </div>
                            <div class="d-flex align-items-center justify-content-between flex-wrap gap-2 pt-3 border-top border-white border-opacity-15">
                                <div>
                                    <span class="fs-3 fw-bold" style="color: #fef08a;">₹799</span>
                                    <span class="text-decoration-line-through text-white-50 ms-2 small">₹1,150</span>
                                    <span class="badge bg-warning text-dark ms-2 px-2 py-1 small rounded-pill">-30%</span>
                                </div>
                                <a href="{{ route('products.index') }}" class="btn rounded-pill px-4 fw-bold shadow-sm" style="background: #fef08a; color: #7c1a0a;">
                                    🛒 Order Platter
                                </a>
                            </div>
                        </div>
                        <div class="p-3 text-center flex-shrink-0" style="width: 200px; max-width: 100%;">
                            <img src="{{ asset('storage/media/takeaway_bento_box.jpg') }}" 
                                 alt="Himalayan Feast Mega Party Platter" 
                                 class="img-fluid rounded-4 shadow-sm w-100" 
                                 style="height: 170px; object-fit: cover; border: 1px solid rgba(255,255,255,0.2);">
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
