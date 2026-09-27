# Hey Sethu

A static date-planning page, deployed with GitHub Pages. Responses are stored in Supabase; the site can submit responses but cannot read them.

The page is public, and anyone who visits it can submit a response. Keep that in mind before sharing the link.

## Connect Supabase

1. Create a Supabase project.
2. Open the project's SQL Editor and run [`supabase.sql`](supabase.sql).
3. In Supabase project settings, copy the Project URL and the anon/publishable key. These values are public by design; never put a `service_role` key in this site.
4. In [`index.html`](index.html), replace `YOUR_PROJECT_ID` in `SUPABASE_URL` with your project URL and replace `YOUR_SUPABASE_ANON_KEY` with the anon/publishable key.
5. Open **Table Editor** in Supabase and inspect the `date_responses` table to see submissions. Row-level security blocks public reads; only your signed-in Supabase dashboard can view the rows.

The database permits anonymous inserts only. Do not add a public `SELECT` policy or put an admin/service key in the HTML.

## Deploy to GitHub Pages

1. Create a new GitHub repository for this site (make it public if your GitHub plan requires that for Pages) and push the contents of this folder to its `main` branch.
2. In repository **Settings > Pages**, set the build and deployment source to **GitHub Actions**.
3. The workflow in `.github/workflows/pages.yml` publishes the site after each push to `main`. GitHub will show the public URL under **Settings > Pages**.

GitHub Pages hosts the static website; Supabase hosts the response database. The original `Hey Sethu.html` in the Desktop folder is left unchanged.