<section class="press-split-wrap py-5 my-4 bg-white" id="press-section">
    <div class="container press-container">
        <div class="row g-4 g-lg-5 align-items-center justify-content-center">
            <!-- Left Column: The Moving Newspaper Collage -->
            <div class="col-xl-9 col-lg-9 col-md-18 col-18 order-2 order-lg-1">
                <div class="position-relative pe-lg-2">
                    <!-- Top caption hint -->
                    <div class="d-flex align-items-center justify-content-between mb-2 px-1">
                        <small class="text-secondary fw-bold">
                            <i class="las la-newspaper text-danger me-1"></i> Archival Newspaper Prints
                        </small>
                        <small class="text-muted" style="font-size: 0.72rem;">
                            <i class="las la-pause-circle me-1 text-primary"></i> Hover to pause • Click to zoom
                        </small>
                    </div>

                    <!-- The 2-Column Vertical Scrolling Collage Viewport -->
                    <div class="press-collage-viewport">
                        <div class="press-collage-columns">
                            <!-- Column 1: Moving Up -->
                            <div class="press-marquee-track track-up">
                                @php
                                    $col1Items = [
                                        [
                                            'img' => 'press_times_of_india.jpg',
                                            'pub' => 'The Times of India',
                                            'tagClass' => 'text-danger',
                                            'headline' => 'Siliguri startup creates blast-frozen momos, bags IIM-C incubation',
                                            'date' => 'National Daily'
                                        ],
                                        [
                                            'img' => 'press_anandabazar_patrika.jpg',
                                            'pub' => 'Anandabazar Patrika',
                                            'tagClass' => 'text-danger',
                                            'headline' => 'Siliguri Momo Revolution: Authentic Himalayan Flavours Win Bengal',
                                            'date' => 'Lead Story'
                                        ],
                                        [
                                            'img' => 'press_egiye_bangla_award.jpg',
                                            'pub' => '🏆 Zee Bangla • Egiye Bangla',
                                            'tagClass' => 'text-warning',
                                            'headline' => 'Siliguri couple emerged as God’s angel for closed tea garden workers',
                                            'date' => 'TV Reality Show & State Honours'
                                        ],
                                        [
                                            'img' => 'press_dainik_jagran.jpg',
                                            'pub' => 'Dainik Jagran',
                                            'tagClass' => 'text-warning',
                                            'headline' => 'New Identity for Mountain Momos: Authentic Taste Meets Strict Hygiene',
                                            'date' => 'National Daily'
                                        ],
                                        [
                                            'img' => 'press_karmakshetra.jpg',
                                            'pub' => 'Karmakshetra',
                                            'tagClass' => 'text-success',
                                            'headline' => 'New Horizons in Food Enterprise: Inspiring North Bengal Youth',
                                            'date' => 'Youth Enterprise'
                                        ]
                                    ];
                                @endphp

                                <!-- Set 1 -->
                                @foreach($col1Items as $item)
                                    <div class="press-collage-card" onclick="openPressModal('{{ asset('storage/media/' . $item['img']) }}', '{{ $item['pub'] }}', '{{ $item['headline'] }}')">
                                        <div class="press-card-img-wrap">
                                            <img src="{{ asset('storage/media/' . $item['img']) }}" alt="{{ $item['pub'] }}" loading="lazy">
                                        </div>
                                        <div class="card-caption">
                                            <div class="d-flex justify-content-between align-items-center">
                                                <span class="pub-tag {{ $item['tagClass'] }}">{{ $item['pub'] }}</span>
                                                <small class="text-muted" style="font-size: 0.65rem;">{{ $item['date'] }}</small>
                                            </div>
                                            <div class="headline-text">{{ $item['headline'] }}</div>
                                        </div>
                                    </div>
                                @endforeach

                                <!-- Set 2 (Duplicated for seamless infinite marquee loop) -->
                                @foreach($col1Items as $item)
                                    <div class="press-collage-card" onclick="openPressModal('{{ asset('storage/media/' . $item['img']) }}', '{{ $item['pub'] }}', '{{ $item['headline'] }}')">
                                        <div class="press-card-img-wrap">
                                            <img src="{{ asset('storage/media/' . $item['img']) }}" alt="{{ $item['pub'] }}" loading="lazy">
                                        </div>
                                        <div class="card-caption">
                                            <div class="d-flex justify-content-between align-items-center">
                                                <span class="pub-tag {{ $item['tagClass'] }}">{{ $item['pub'] }}</span>
                                                <small class="text-muted" style="font-size: 0.65rem;">{{ $item['date'] }}</small>
                                            </div>
                                            <div class="headline-text">{{ $item['headline'] }}</div>
                                        </div>
                                    </div>
                                @endforeach
                            </div>

                            <!-- Column 2: Moving Down -->
                            <div class="press-marquee-track track-down">
                                @php
                                    $col2Items = [
                                        [
                                            'img' => 'press_the_statesman.jpg',
                                            'pub' => 'The Statesman',
                                            'tagClass' => 'text-primary',
                                            'headline' => 'Momos on Wheels takes Siliguri by storm with mountain recipe',
                                            'date' => 'Special Feature'
                                        ],
                                        [
                                            'img' => 'press_ei_samay.jpg',
                                            'pub' => 'Ei Samay',
                                            'tagClass' => 'text-success',
                                            'headline' => 'Standing by Closed Tea-Garden Families with Himalayan Momos',
                                            'date' => 'Business Edition'
                                        ],
                                        [
                                            'img' => 'press_sikkim_express.jpg',
                                            'pub' => 'Sikkim Express',
                                            'tagClass' => 'text-info',
                                            'headline' => 'Authentic Mountain Flavours Reaching Metropolitan Kitchens',
                                            'date' => 'Himalayan Daily'
                                        ],
                                        [
                                            'img' => 'press_himalayan_mirror.jpg',
                                            'pub' => 'Himalayan Mirror',
                                            'tagClass' => 'text-dark',
                                            'headline' => 'Siliguri’s Pride: Shambhala Food Products bags State Honours',
                                            'date' => 'Regional Chronicle'
                                        ],
                                        [
                                            'img' => 'press_dog_welfare.jpg',
                                            'pub' => 'The Echo of India',
                                            'tagClass' => 'text-secondary',
                                            'headline' => 'Siliguri entrepreneur supports 45+ rescued stray dogs from momo revenue',
                                            'date' => 'Community Welfare'
                                        ]
                                    ];
                                @endphp

                                <!-- Set 1 -->
                                @foreach($col2Items as $item)
                                    <div class="press-collage-card" onclick="openPressModal('{{ asset('storage/media/' . $item['img']) }}', '{{ $item['pub'] }}', '{{ $item['headline'] }}')">
                                        <div class="press-card-img-wrap">
                                            <img src="{{ asset('storage/media/' . $item['img']) }}" alt="{{ $item['pub'] }}" loading="lazy">
                                        </div>
                                        <div class="card-caption">
                                            <div class="d-flex justify-content-between align-items-center">
                                                <span class="pub-tag {{ $item['tagClass'] }}">{{ $item['pub'] }}</span>
                                                <small class="text-muted" style="font-size: 0.65rem;">{{ $item['date'] }}</small>
                                            </div>
                                            <div class="headline-text">{{ $item['headline'] }}</div>
                                        </div>
                                    </div>
                                @endforeach

                                <!-- Set 2 (Duplicated for seamless infinite marquee loop) -->
                                @foreach($col2Items as $item)
                                    <div class="press-collage-card" onclick="openPressModal('{{ asset('storage/media/' . $item['img']) }}', '{{ $item['pub'] }}', '{{ $item['headline'] }}')">
                                        <div class="press-card-img-wrap">
                                            <img src="{{ asset('storage/media/' . $item['img']) }}" alt="{{ $item['pub'] }}" loading="lazy">
                                        </div>
                                        <div class="card-caption">
                                            <div class="d-flex justify-content-between align-items-center">
                                                <span class="pub-tag {{ $item['tagClass'] }}">{{ $item['pub'] }}</span>
                                                <small class="text-muted" style="font-size: 0.65rem;">{{ $item['date'] }}</small>
                                            </div>
                                            <div class="headline-text">{{ $item['headline'] }}</div>
                                        </div>
                                    </div>
                                @endforeach
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Right Column: Text Content & Interactive Publication Buttons -->
            <div class="col-xl-9 col-lg-9 col-md-18 col-18 order-1 order-lg-2">
                <div class="ps-lg-3">
                    <span class="badge px-3 py-2 rounded-pill fw-semibold text-uppercase mb-2" style="background-color: #c46210; color: #fff; letter-spacing: 1.5px; font-size: 0.78rem;">
                        <i class="las la-award me-1"></i> National Media & Press Coverage
                    </span>

                    <h2 class="fw-bold text-dark mt-2 mb-3" style="font-size: 2.2rem; letter-spacing: -0.5px; line-height: 1.25;">
                        As Seen Across India's Leading Publications
                    </h2>

                    <p class="text-secondary mb-4" style="font-size: 1.02rem; line-height: 1.65;">
                        From <strong>The Times of India</strong> and <strong>The Statesman</strong> to <strong>Anandabazar Patrika</strong> — national journalists documented our journey from local Siliguri carts to a breakthrough Himalayan food enterprise.
                    </p>

                    <!-- Editorial Quote Highlights Card -->
                    <div class="p-3 rounded-4 mb-4" style="background: #faf8f5; border: 1px solid #ede7dc; border-left: 4px solid #c46210;">
                        <div class="d-flex align-items-center justify-content-between mb-1">
                            <span class="badge bg-danger text-white fw-bold px-2 py-1" style="font-size: 0.7rem;">
                                The Times of India
                            </span>
                            <small class="text-muted">National Feature</small>
                        </div>
                        <p class="fst-italic text-dark mb-0" style="font-size: 0.88rem; line-height: 1.45;">
                            "Siliguri startup creates blast-frozen momos, bags IIM-C incubation — pioneering cryogenic unbroken food preservation in North Bengal."
                        </p>
                    </div>

                    <!-- Interactive Publication Buttons Header -->
                    <div class="mb-2">
                        <span class="text-secondary small fw-bold">
                            <i class="las la-mouse-pointer text-success me-1"></i> Click any publication below to open its archival clipping:
                        </span>
                    </div>

                    <!-- Interactive Buttons Ribbon -->
                    <div class="d-flex flex-wrap align-items-center gap-2 mb-4">
                        <button type="button" 
                                class="press-pub-btn" 
                                title="Click to view The Times of India clipping"
                                onclick="selectPressPublication(this, '{{ asset('storage/media/press_times_of_india.jpg') }}', 'The Times of India', 'Siliguri startup creates blast-frozen momos, bags IIM-C incubation')">
                            <span>📰 THE TIMES OF INDIA</span>
                            <i class="las la-search-plus text-muted press-btn-icon"></i>
                        </button>

                        <button type="button" 
                                class="press-pub-btn" 
                                title="Click to view The Statesman clipping"
                                onclick="selectPressPublication(this, '{{ asset('storage/media/press_the_statesman.jpg') }}', 'The Statesman', 'Momos on Wheels takes Siliguri by storm with mountain recipe')">
                            <span>🏛️ THE STATESMAN</span>
                            <i class="las la-search-plus text-muted press-btn-icon"></i>
                        </button>

                        <button type="button" 
                                class="press-pub-btn" 
                                title="Click to view Anandabazar Patrika clipping"
                                onclick="selectPressPublication(this, '{{ asset('storage/media/press_anandabazar_patrika.jpg') }}', 'Anandabazar Patrika', 'Siliguri Momo Revolution: Authentic Himalayan Flavours Win Bengal')">
                            <span>🖋️ ANANDABAZAR PATRIKA</span>
                            <i class="las la-search-plus text-muted press-btn-icon"></i>
                        </button>

                        <button type="button" 
                                class="press-pub-btn" 
                                title="Click to view Ei Samay clipping"
                                onclick="selectPressPublication(this, '{{ asset('storage/media/press_ei_samay.jpg') }}', 'Ei Samay', 'Standing by Closed Tea-Garden Families with Himalayan Momos')">
                            <span>⚡ EI SAMAY</span>
                            <i class="las la-search-plus text-muted press-btn-icon"></i>
                        </button>

                        <button type="button" 
                                class="press-pub-btn" 
                                title="Click to view Dainik Jagran clipping"
                                onclick="selectPressPublication(this, '{{ asset('storage/media/press_dainik_jagran.jpg') }}', 'Dainik Jagran', 'New Identity for Mountain Momos: Authentic Taste Meets Strict Hygiene')">
                            <span>☀️ DAINIK JAGRAN</span>
                            <i class="las la-search-plus text-muted press-btn-icon"></i>
                        </button>

                        <button type="button" 
                                class="press-pub-btn" 
                                title="Click to view Sikkim Express clipping"
                                onclick="selectPressPublication(this, '{{ asset('storage/media/press_sikkim_express.jpg') }}', 'Sikkim Express', 'Authentic Mountain Flavours Reaching Metropolitan Kitchens')">
                            <span>🏔️ SIKKIM EXPRESS</span>
                            <i class="las la-search-plus text-muted press-btn-icon"></i>
                        </button>

                        <button type="button" 
                                class="press-pub-btn award-pill" 
                                title="Click to view Zee Bangla • Egiye Bangla TV feature & awards"
                                onclick="selectPressPublication(this, '{{ asset('storage/media/press_egiye_bangla_award.jpg') }}', 'Zee Bangla • Egiye Bangla', 'Siliguri couple emerged as God’s angel for closed tea garden workers — Egiye Bangla Business Reality Show')">
                            <span>🏆 ZEE BANGLA • EGIYE BANGLA</span>
                            <i class="las la-search-plus text-warning press-btn-icon"></i>
                        </button>

                        <button type="button" 
                                class="press-pub-btn" 
                                title="Click to view Himalayan Mirror clipping"
                                onclick="selectPressPublication(this, '{{ asset('storage/media/press_himalayan_mirror.jpg') }}', 'Himalayan Mirror', 'Siliguri’s Pride: Shambhala Food Products bags State Honours')">
                            <span>🗞️ HIMALAYAN MIRROR</span>
                            <i class="las la-search-plus text-muted press-btn-icon"></i>
                        </button>

                        <button type="button" 
                                class="press-pub-btn" 
                                title="Click to view Karmakshetra clipping"
                                onclick="selectPressPublication(this, '{{ asset('storage/media/press_karmakshetra.jpg') }}', 'Karmakshetra', 'New Horizons in Food Enterprise: Inspiring North Bengal Youth')">
                            <span>💼 KARMAKSHETRA</span>
                            <i class="las la-search-plus text-muted press-btn-icon"></i>
                        </button>
                    </div>

                    <!-- Credibility Badges Metric Strip -->
                    <div class="row g-2 pt-2 border-top">
                        <div class="col-4">
                            <div class="p-2 border rounded-3 text-center bg-light">
                                <div class="fw-bold text-dark fs-5">10+</div>
                                <div class="text-muted" style="font-size: 0.72rem;">Media Portals</div>
                            </div>
                        </div>
                        <div class="col-4">
                            <div class="p-2 border rounded-3 text-center bg-light">
                                <div class="fw-bold text-success fs-5">IIM-C</div>
                                <div class="text-muted" style="font-size: 0.72rem;">Innovation Park</div>
                            </div>
                        </div>
                        <div class="col-4">
                            <div class="p-2 border rounded-3 text-center bg-light">
                                <div class="fw-bold text-warning fs-5">Zee TV</div>
                                <div class="text-muted" style="font-size: 0.72rem;">State Honours</div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- Lightbox Modal for Press Cuttings -->
    <div class="modal fade" id="pressClippingModal" tabindex="-1" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered modal-lg">
            <div class="modal-content rounded-4 border-0 overflow-hidden shadow-lg">
                <div class="modal-header border-0 bg-light py-2 px-3 align-items-center">
                    <div>
                        <span class="badge bg-primary text-white px-2 py-1" id="modalPressBadge">News Article</span>
                        <h6 class="modal-title fw-bold text-dark mt-1 mb-0" id="modalPressTitle"></h6>
                    </div>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" data-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body p-0 text-center bg-dark" style="max-height: 80vh; overflow-y: auto;">
                    <img src="" id="modalPressImage" class="img-fluid" style="max-height: 75vh; width: auto;" alt="Press Clipping">
                </div>
                <div class="modal-footer border-0 bg-light py-2 px-3 justify-content-between">
                    <small class="text-muted">Authentic archival clipping from Shambhala Food Products Pvt. Ltd.</small>
                    <div class="d-flex gap-2">
                        <a href="#" id="modalPressFullLink" target="_blank" class="btn btn-sm btn-outline-dark rounded-pill px-3">
                            <i class="las la-external-link-alt"></i> Open Full Image
                        </a>
                        <button type="button" class="btn btn-sm btn-secondary rounded-pill px-3" data-bs-dismiss="modal" data-dismiss="modal">Close</button>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>

<script>
function selectPressPublication(btn, imageSrc, publication, headline) {
    document.querySelectorAll('.press-pub-btn').forEach(function(b) {
        b.classList.remove('active-pub');
    });
    if (btn) {
        btn.classList.add('active-pub');
    }
    openPressModal(imageSrc, publication, headline);
}

function openPressModal(imageSrc, publication, headline) {
    var modalImg = document.getElementById('modalPressImage');
    var modalBadge = document.getElementById('modalPressBadge');
    var modalTitle = document.getElementById('modalPressTitle');
    var modalFullLink = document.getElementById('modalPressFullLink');
    
    if (modalImg && modalBadge && modalTitle) {
        modalImg.src = imageSrc;
        modalBadge.textContent = publication;
        modalTitle.textContent = headline;
        if (modalFullLink) {
            modalFullLink.href = imageSrc;
        }
        
        if (window.bootstrap && window.bootstrap.Modal) {
            var modalEl = document.getElementById('pressClippingModal');
            var modal = bootstrap.Modal.getInstance(modalEl) || new bootstrap.Modal(modalEl);
            modal.show();
        } else {
            window.open(imageSrc, '_blank');
        }
    }
}
</script>
