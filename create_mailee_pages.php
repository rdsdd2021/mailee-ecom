<?php

use Modules\Page\Entities\Page;
use Modules\Menu\Entities\Menu;
use Modules\Menu\Entities\MenuItem;
use Modules\Setting\Entities\Setting;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Cache;

require __DIR__ . '/vendor/autoload.php';
$app = require_once __DIR__ . '/bootstrap/app.php';
$kernel = $app->make(Illuminate\Contracts\Console\Kernel::class);
$kernel->bootstrap();

echo "Updating CMS Pages with Premium Alignment & Design...\n";

$pagesData = [
    [
        'name' => 'About Us',
        'slug' => 'about-us',
        'body' => '
            <div class="about-page-wrapper">
                <!-- Hero Banner Card -->
                <div style="background: linear-gradient(135deg, #f4f9f6 0%, #e8f4ee 100%); padding: 35px; border-radius: 12px; border: 1px solid #d4e8dd; margin-bottom: 35px; display: flex; align-items: center; justify-content: space-between; flex-wrap: wrap;">
                    <div style="flex: 1; min-width: 280px; padding-right: 20px;">
                        <span style="background: #1b4d3e; color: #ffffff; padding: 4px 12px; border-radius: 20px; font-size: 0.85rem; font-weight: 600; text-transform: uppercase; letter-spacing: 0.5px;">About Mailee</span>
                        <h2 style="color: #1b4d3e; font-size: 2rem; font-weight: 700; margin: 15px 0 10px 0;">Authentic Himalayan & Nepali Flavors</h2>
                        <p style="font-size: 1.05rem; color: #4a5568; line-height: 1.7; margin: 0;">
                            Born in North Bengal, <strong>Mailee Frozen Foods</strong> bridges traditional mountain culinary heritage with modern cold-chain convenience. From handcrafted momos to flaky Malabar parathas, we bring restaurant-quality frozen foods straight to your home freezer.
                        </p>
                    </div>
                </div>

                <!-- 3 Pillars Grid -->
                <h3 style="color: #1b4d3e; font-size: 1.5rem; font-weight: 700; margin-bottom: 20px; text-align: center;">Why Families Love Mailee</h3>
                <div style="display: grid; grid-template-columns: repeat(auto-fit, minmax(280px, 1fr)); gap: 20px; margin-bottom: 40px;">
                    <div style="background: #ffffff; padding: 25px; border-radius: 10px; border: 1px solid #e2e8f0; box-shadow: 0 2px 10px rgba(0,0,0,0.03); text-align: center;">
                        <div style="width: 60px; height: 60px; background: #e8f4ee; color: #1b4d3e; border-radius: 50%; display: inline-flex; align-items: center; justify-content: center; font-size: 1.8rem; margin-bottom: 15px;">
                            <i class="las la-utensils"></i>
                        </div>
                        <h4 style="color: #2d3748; font-size: 1.2rem; font-weight: 600; margin-bottom: 10px;">Authentic Recipes</h4>
                        <p style="color: #718096; font-size: 0.95rem; line-height: 1.6; margin: 0;">Made with authentic Nepali & Darjeeling spice blends crafted by seasoned mountain chefs.</p>
                    </div>

                    <div style="background: #ffffff; padding: 25px; border-radius: 10px; border: 1px solid #e2e8f0; box-shadow: 0 2px 10px rgba(0,0,0,0.03); text-align: center;">
                        <div style="width: 60px; height: 60px; background: #e8f4ee; color: #1b4d3e; border-radius: 50%; display: inline-flex; align-items: center; justify-content: center; font-size: 1.8rem; margin-bottom: 15px;">
                            <i class="las la-snowflake"></i>
                        </div>
                        <h4 style="color: #2d3748; font-size: 1.2rem; font-weight: 600; margin-bottom: 10px;">Flash-Frozen Fresh</h4>
                        <p style="color: #718096; font-size: 0.95rem; line-height: 1.6; margin: 0;">Quick-frozen at -18°C to lock in juice, taste, and nutrition with zero artificial preservatives.</p>
                    </div>

                    <div style="background: #ffffff; padding: 25px; border-radius: 10px; border: 1px solid #e2e8f0; box-shadow: 0 2px 10px rgba(0,0,0,0.03); text-align: center;">
                        <div style="width: 60px; height: 60px; background: #e8f4ee; color: #1b4d3e; border-radius: 50%; display: inline-flex; align-items: center; justify-content: center; font-size: 1.8rem; margin-bottom: 15px;">
                            <i class="las la-shipping-fast"></i>
                        </div>
                        <h4 style="color: #2d3748; font-size: 1.2rem; font-weight: 600; margin-bottom: 10px;">Express Cold Delivery</h4>
                        <p style="color: #718096; font-size: 0.95rem; line-height: 1.6; margin: 0;">Temperature-controlled delivery hubs operating across Siliguri, Darjeeling & Jalpaiguri.</p>
                    </div>
                </div>

                <!-- Membership Banner Feature -->
                <div style="background: linear-gradient(135deg, #1b4d3e 0%, #11362b 100%); color: #ffffff; padding: 35px; border-radius: 12px; margin-bottom: 30px; display: flex; align-items: center; justify-content: space-between; flex-wrap: wrap;">
                    <div style="flex: 1; min-width: 280px; padding-right: 20px;">
                        <span style="background: #e2b714; color: #1a202c; padding: 4px 10px; border-radius: 4px; font-size: 0.8rem; font-weight: 700; text-transform: uppercase;">Wholesale Direct</span>
                        <h3 style="color: #ffffff; font-size: 1.6rem; font-weight: 700; margin: 10px 0;">Mailee ₹10 VIP Wholesale Pass</h3>
                        <p style="color: #d0e7de; font-size: 1rem; line-height: 1.6; margin: 0;">
                            Join our membership program for just ₹10 and unlock extreme member discounts up to 70% OFF across our entire frozen food catalog.
                        </p>
                    </div>
                    <div style="margin-top: 15px;">
                        <a href="/products/mailee-rs10-vip-club-membership-pass" style="background: #e2b714; color: #1a202c; font-weight: 700; padding: 12px 28px; border-radius: 6px; text-decoration: none; display: inline-block; transition: all 0.3s ease;">Get ₹10 Pass Now →</a>
                    </div>
                </div>
            </div>
        ',
    ],
    [
        'name' => 'Contact Us',
        'slug' => 'contact-us',
        'body' => '
            <div class="contact-page-wrapper">
                <div style="text-align: center; margin-bottom: 35px;">
                    <h2 style="color: #1b4d3e; font-size: 1.8rem; font-weight: 700; margin-bottom: 10px;">We\'d Love to Hear From You</h2>
                    <p style="color: #718096; font-size: 1.05rem; max-width: 600px; margin: 0 auto;">Have a question about your order, cold-chain delivery, or bulk orders? Reach out to our Siliguri support team.</p>
                </div>

                <div style="display: grid; grid-template-columns: repeat(auto-fit, minmax(300px, 1fr)); gap: 25px; margin-bottom: 40px;">
                    <!-- Card 1 -->
                    <div style="background: #f8faf9; padding: 30px; border-radius: 10px; border: 1px solid #e2e8f0;">
                        <div style="font-size: 2rem; color: #1b4d3e; margin-bottom: 15px;"><i class="las la-map-marked-alt"></i></div>
                        <h4 style="color: #1b4d3e; font-size: 1.2rem; font-weight: 600; margin-bottom: 8px;">Head Office & Hub</h4>
                        <p style="color: #4a5568; line-height: 1.6; margin: 0;">Mailee Frozen Foods Pvt Ltd<br>Hill Cart Road, Near Airview Bus Stand<br>Siliguri, West Bengal – 734001</p>
                    </div>

                    <!-- Card 2 -->
                    <div style="background: #f8faf9; padding: 30px; border-radius: 10px; border: 1px solid #e2e8f0;">
                        <div style="font-size: 2rem; color: #1b4d3e; margin-bottom: 15px;"><i class="las la-envelope-open-text"></i></div>
                        <h4 style="color: #1b4d3e; font-size: 1.2rem; font-weight: 600; margin-bottom: 8px;">Email Inquiries</h4>
                        <p style="color: #4a5568; line-height: 1.6; margin: 0;">
                            Customer Support: <a href="mailto:contact@mailee.in" style="color: #1b4d3e; font-weight: 600;">contact@mailee.in</a><br>
                            VIP Club Help: <a href="mailto:vip@mailee.in" style="color: #1b4d3e; font-weight: 600;">vip@mailee.in</a>
                        </p>
                    </div>

                    <!-- Card 3 -->
                    <div style="background: #f8faf9; padding: 30px; border-radius: 10px; border: 1px solid #e2e8f0;">
                        <div style="font-size: 2rem; color: #1b4d3e; margin-bottom: 15px;"><i class="las la-phone-volume"></i></div>
                        <h4 style="color: #1b4d3e; font-size: 1.2rem; font-weight: 600; margin-bottom: 8px;">Helpline & WhatsApp</h4>
                        <p style="color: #4a5568; line-height: 1.6; margin: 0;">
                            Phone: <strong>+91 98320 12345</strong><br>
                            Working Hours: Mon – Sat, 8:00 AM – 8:00 PM
                        </p>
                    </div>
                </div>

                <!-- Interactive Contact Form -->
                <div style="background: #ffffff; padding: 35px; border-radius: 12px; border: 1px solid #e2e8f0; box-shadow: 0 4px 15px rgba(0,0,0,0.04);">
                    <h3 style="color: #1b4d3e; font-size: 1.4rem; font-weight: 700; margin-bottom: 20px;">Send Us a Direct Message</h3>
                    <form onsubmit="event.preventDefault(); alert(\'Thank you for contacting Mailee! Our team will respond shortly.\');">
                        <div style="display: grid; grid-template-columns: repeat(auto-fit, minmax(240px, 1fr)); gap: 15px; margin-bottom: 15px;">
                            <div>
                                <label style="display: block; font-weight: 600; color: #4a5568; margin-bottom: 5px;">Your Name</label>
                                <input type="text" required placeholder="Enter full name" style="width: 100%; padding: 10px 14px; border: 1px solid #cbd5e0; border-radius: 6px; outline: none;">
                            </div>
                            <div>
                                <label style="display: block; font-weight: 600; color: #4a5568; margin-bottom: 5px;">Email Address</label>
                                <input type="email" required placeholder="name@example.com" style="width: 100%; padding: 10px 14px; border: 1px solid #cbd5e0; border-radius: 6px; outline: none;">
                            </div>
                        </div>

                        <div style="margin-bottom: 15px;">
                            <label style="display: block; font-weight: 600; color: #4a5568; margin-bottom: 5px;">Subject</label>
                            <input type="text" required placeholder="e.g. Bulk Momo Order Inquiry" style="width: 100%; padding: 10px 14px; border: 1px solid #cbd5e0; border-radius: 6px; outline: none;">
                        </div>

                        <div style="margin-bottom: 20px;">
                            <label style="display: block; font-weight: 600; color: #4a5568; margin-bottom: 5px;">Message</label>
                            <textarea rows="4" required placeholder="How can we assist you?" style="width: 100%; padding: 10px 14px; border: 1px solid #cbd5e0; border-radius: 6px; outline: none;"></textarea>
                        </div>

                        <button type="submit" style="background: #1b4d3e; color: #ffffff; font-weight: 600; padding: 12px 30px; border: none; border-radius: 6px; cursor: pointer; transition: background 0.3s ease;">Send Message</button>
                    </form>
                </div>
            </div>
        ',
    ],
    [
        'name' => 'Media & Press',
        'slug' => 'media',
        'body' => '
            <div class="media-page-wrapper">
                <div style="text-align: center; margin-bottom: 35px;">
                    <h2 style="color: #1b4d3e; font-size: 1.8rem; font-weight: 700; margin-bottom: 10px;">Mailee Press Room & Media Center</h2>
                    <p style="color: #718096; font-size: 1.05rem; max-width: 600px; margin: 0 auto;">Official press releases, culinary news coverage, and brand media kits.</p>
                </div>

                <div style="display: grid; grid-template-columns: repeat(auto-fit, minmax(300px, 1fr)); gap: 20px; margin-bottom: 40px;">
                    <!-- Release 1 -->
                    <div style="background: #ffffff; padding: 25px; border-radius: 10px; border: 1px solid #e2e8f0; box-shadow: 0 2px 10px rgba(0,0,0,0.03);">
                        <span style="background: #e8f4ee; color: #1b4d3e; padding: 3px 10px; border-radius: 15px; font-size: 0.8rem; font-weight: 600;">PRESS RELEASE</span>
                        <span style="color: #a0aec0; font-size: 0.85rem; margin-left: 10px;">August 2026</span>
                        <h4 style="color: #2d3748; font-size: 1.15rem; font-weight: 600; margin: 12px 0 8px 0;">Mailee Launches ₹10 VIP Pass for Wholesale Frozen Foods in North Bengal</h4>
                        <p style="color: #718096; font-size: 0.95rem; line-height: 1.6; margin: 0;">Siliguri-based frozen food startup introduces direct-to-consumer wholesale membership pass for authentic Himalayan momos and snacks.</p>
                    </div>

                    <!-- Release 2 -->
                    <div style="background: #ffffff; padding: 25px; border-radius: 10px; border: 1px solid #e2e8f0; box-shadow: 0 2px 10px rgba(0,0,0,0.03);">
                        <span style="background: #e8f4ee; color: #1b4d3e; padding: 3px 10px; border-radius: 15px; font-size: 0.8rem; font-weight: 600;">CULINARY FEATURE</span>
                        <span style="color: #a0aec0; font-size: 0.85rem; margin-left: 10px;">July 2026</span>
                        <h4 style="color: #2d3748; font-size: 1.15rem; font-weight: 600; margin: 12px 0 8px 0;">The Rise of Authentic Darjeeling & Nepali Momos in Modern Kitchens</h4>
                        <p style="color: #718096; font-size: 0.95rem; line-height: 1.6; margin: 0;">Food trend analysis highlights Mailee\'s flash-freeze technique preserving traditional mountain flavors without artificial preservatives.</p>
                    </div>
                </div>

                <!-- Brand Kit Box -->
                <div style="background: #f8faf9; padding: 30px; border-radius: 10px; border: 1px dashed #1b4d3e; display: flex; align-items: center; justify-content: space-between; flex-wrap: wrap;">
                    <div>
                        <h4 style="color: #1b4d3e; font-size: 1.2rem; font-weight: 600; margin: 0 0 5px 0;">Official Media & Brand Assets</h4>
                        <p style="color: #718096; margin: 0; font-size: 0.95rem;">Download high-resolution Mailee logos, product photography catalog, and brand guidelines.</p>
                    </div>
                    <div style="margin-top: 15px;">
                        <a href="mailto:media@mailee.in?subject=Request%20Media%20Kit" style="background: #1b4d3e; color: #ffffff; padding: 10px 22px; border-radius: 6px; text-decoration: none; font-weight: 600;">Request Media Kit</a>
                    </div>
                </div>
            </div>
        ',
    ],
    [
        'name' => 'Privacy Policy',
        'slug' => 'privacy-policy',
        'body' => '
            <div class="privacy-page-wrapper" style="line-height: 1.8; color: #4a5568;">
                <div style="background: #f8faf9; padding: 20px; border-radius: 8px; border-left: 4px solid #1b4d3e; margin-bottom: 25px;">
                    <p style="margin: 0; font-weight: 600; color: #1b4d3e;"><i class="las la-shield-alt" style="font-size: 1.3rem; vertical-align: middle;"></i> Your Privacy & Data Security Matter to Us</p>
                </div>

                <h3 style="color: #1b4d3e; font-size: 1.3rem; font-weight: 700; margin: 20px 0 10px 0;">1. Information We Collect</h3>
                <p>When you place an order or sign up for the Mailee ₹10 VIP Pass, we collect your name, shipping address, email address, and phone number to fulfill your delivery via cold-chain logistics.</p>

                <h3 style="color: #1b4d3e; font-size: 1.3rem; font-weight: 700; margin: 20px 0 10px 0;">2. How We Protect Your Data</h3>
                <p>All sensitive information is processed over 256-bit SSL encrypted connection. We do not store credit card details or share your personal information with third-party advertisers.</p>

                <h3 style="color: #1b4d3e; font-size: 1.3rem; font-weight: 700; margin: 20px 0 10px 0;">3. Contact Privacy Officer</h3>
                <p>If you have questions regarding our data protection policies, please contact our privacy compliance team at <a href="mailto:privacy@mailee.in" style="color: #1b4d3e; font-weight: 600;">privacy@mailee.in</a>.</p>
            </div>
        ',
    ],
];

DB::statement('SET FOREIGN_KEY_CHECKS=0;');
DB::table('pages')->truncate();
DB::table('page_translations')->truncate();
DB::statement('SET FOREIGN_KEY_CHECKS=1;');

DB::beginTransaction();

try {
    $createdPages = [];

    foreach ($pagesData as $pData) {
        $pageId = DB::table('pages')->insertGetId([
            'slug' => $pData['slug'],
            'is_active' => 1,
            'created_at' => now(),
            'updated_at' => now(),
        ]);

        DB::table('page_translations')->insert([
            'page_id' => $pageId,
            'locale' => 'en',
            'name' => $pData['name'],
            'body' => trim($pData['body']),
        ]);

        $createdPages[$pData['slug']] = $pageId;
        echo "Updated Page: {$pData['name']} (ID: {$pageId}, Slug: {$pData['slug']})\n";
    }

    // Attach Pages to Primary Menu
    $primMenuId = setting('storefront_primary_menu');
    if ($primMenuId) {
        $rootPrimMenuItem = MenuItem::withoutGlobalScope('not_root')
            ->where('menu_id', $primMenuId)
            ->where('is_root', 1)
            ->first();

        if ($rootPrimMenuItem) {
            $pageLinks = [
                ['name' => 'About Us', 'page_id' => $createdPages['about-us']],
                ['name' => 'Media & Press', 'page_id' => $createdPages['media']],
                ['name' => 'Contact Us', 'page_id' => $createdPages['contact-us']],
            ];

            $lastPos = MenuItem::where('menu_id', $primMenuId)->max('position') ?: 5;

            foreach ($pageLinks as $pl) {
                MenuItem::create([
                    'menu_id' => $primMenuId,
                    'page_id' => $pl['page_id'],
                    'parent_id' => $rootPrimMenuItem->id,
                    'type' => 'page',
                    'target' => '_self',
                    'is_root' => 0,
                    'is_fluid' => 0,
                    'is_active' => 1,
                    'position' => ++$lastPos,
                    'name' => $pl['name'],
                ]);
            }
        }
    }

    // Create / Update Footer Menu One
    $footerMenu = Menu::create(['is_active' => 1, 'name' => 'Footer Quick Links']);

    $rootFooterItem = MenuItem::create([
        'menu_id' => $footerMenu->id,
        'type' => 'url',
        'url' => '#',
        'target' => '_self',
        'is_root' => 1,
        'is_fluid' => 0,
        'is_active' => 1,
        'position' => 0,
        'name' => 'Root',
    ]);

    $footerPages = [
        ['name' => 'About Us', 'page_id' => $createdPages['about-us']],
        ['name' => 'Contact Us', 'page_id' => $createdPages['contact-us']],
        ['name' => 'Media & Press', 'page_id' => $createdPages['media']],
        ['name' => 'Privacy Policy', 'page_id' => $createdPages['privacy-policy']],
    ];

    $pos = 1;
    foreach ($footerPages as $fp) {
        MenuItem::create([
            'menu_id' => $footerMenu->id,
            'page_id' => $fp['page_id'],
            'parent_id' => $rootFooterItem->id,
            'type' => 'page',
            'target' => '_self',
            'is_root' => 0,
            'is_fluid' => 0,
            'is_active' => 1,
            'position' => $pos++,
            'name' => $fp['name'],
        ]);
    }

    Setting::setMany([
        'storefront_footer_menu_one' => $footerMenu->id,
        'storefront_footer_menu_one_title' => 'Quick Links',
    ]);

    Cache::tags(['pages', 'mega_menu', 'menu_items', 'settings'])->flush();
    Cache::flush();

    DB::commit();

    echo "SUCCESS: Page content re-aligned with modern card layouts!\n";

} catch (\Throwable $e) {
    DB::rollBack();
    echo "ERROR: " . $e->getMessage() . "\n";
}
