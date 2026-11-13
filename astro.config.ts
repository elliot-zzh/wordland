import { defineConfig } from 'astro/config'
import mdx from '@astrojs/mdx'
import sitemap from '@astrojs/sitemap'
import vue from '@astrojs/vue'
import tailwindcss from '@tailwindcss/vite'

const siteDomain = 'wordland.site'

export default defineConfig({
  site: 'https://' + siteDomain,
  integrations: [mdx(), sitemap(), vue()],
  vite: {
    plugins: [tailwindcss()]
  },
  output: 'static'
})
