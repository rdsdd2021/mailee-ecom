<section class="flash-deal-wrap my-4">
    <div class="container">
        <div class="flash-deal-box p-4 rounded-4 shadow-sm text-white position-relative overflow-hidden" 
             style="background: linear-gradient(135deg, #7c1a06 0%, #a82d08 50%, #c4400e 100%);">
            <div class="row align-items-center">
                <div class="col-lg-6 mb-3 mb-lg-0">
                    <div class="d-inline-flex align-items-center gap-2 px-3 py-1 rounded-pill mb-2" style="background: rgba(255,255,255,0.2);">
                        <span class="badge bg-warning text-dark fw-bold">LIMITED TIME</span>
                        <span class="small fw-semibold">Weekend Special Promo</span>
                    </div>
                    <h2 class="fw-bold text-white mb-2" style="font-size: 1.85rem;">
                        🥟 Himalayan Feast Weekend Deal
                    </h2>
                    <p class="mb-3 text-white-50" style="font-size: 0.95rem;">
                        Get the complete <strong>Himalayan Feast Family Combo</strong> (30 Darjeeling Chicken Momos + 15 Cheese Momos + 2 Signature Dalle Chutneys) for just <strong>₹499</strong> (Save 35%).
                    </p>

                    <!-- Countdown Timer -->
                    <div class="d-flex align-items-center gap-2" id="mailee-countdown-timer">
                        <div class="text-center bg-black bg-opacity-50 px-3 py-2 rounded-3 border border-white border-opacity-25" style="min-width: 60px;">
                            <span class="fs-4 fw-bolder d-block text-warning" id="cd-hours">08</span>
                            <small class="text-uppercase text-white-50" style="font-size: 0.65rem;">Hours</small>
                        </div>
                        <span class="fs-4 fw-bold text-warning">:</span>
                        <div class="text-center bg-black bg-opacity-50 px-3 py-2 rounded-3 border border-white border-opacity-25" style="min-width: 60px;">
                            <span class="fs-4 fw-bolder d-block text-warning" id="cd-mins">24</span>
                            <small class="text-uppercase text-white-50" style="font-size: 0.65rem;">Mins</small>
                        </div>
                        <span class="fs-4 fw-bold text-warning">:</span>
                        <div class="text-center bg-black bg-opacity-50 px-3 py-2 rounded-3 border border-white border-opacity-25" style="min-width: 60px;">
                            <span class="fs-4 fw-bolder d-block text-warning" id="cd-secs">15</span>
                            <small class="text-uppercase text-white-50" style="font-size: 0.65rem;">Secs</small>
                        </div>
                    </div>
                </div>

                <div class="col-lg-6 text-lg-end text-center">
                    <div class="d-inline-block text-start p-3 rounded-3 bg-black bg-opacity-25 border border-white border-opacity-25">
                        <span class="badge bg-danger mb-1">Save ₹270</span>
                        <h4 class="text-white fw-bold mb-1">Himalayan Feast Combo</h4>
                        <div class="d-flex align-items-baseline gap-2 mb-2">
                            <span class="fs-3 fw-bold text-warning">₹499</span>
                            <span class="text-decoration-line-through text-white-50">₹769</span>
                        </div>
                        <a href="{{ route('products.index') }}" class="btn btn-warning btn-lg fw-bold px-4 rounded-pill shadow">
                            ⚡ Claim Offer Now
                        </a>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <script>
        document.addEventListener('DOMContentLoaded', function() {
            let totalSeconds = 8 * 3600 + 24 * 60 + 15;
            const hEl = document.getElementById('cd-hours');
            const mEl = document.getElementById('cd-mins');
            const sEl = document.getElementById('cd-secs');

            setInterval(function() {
                if (totalSeconds > 0) {
                    totalSeconds--;
                    let h = Math.floor(totalSeconds / 3600);
                    let m = Math.floor((totalSeconds % 3600) / 60);
                    let s = totalSeconds % 60;
                    if (hEl) hEl.textContent = String(h).padStart(2, '0');
                    if (mEl) mEl.textContent = String(m).padStart(2, '0');
                    if (sEl) sEl.textContent = String(s).padStart(2, '0');
                }
            }, 1000);
        });
    </script>
</section>
