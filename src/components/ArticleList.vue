<template>
  <h2
    v-if="mode === 'Simple'"
    class="title-recent flex items-center mt-[8px] mb-[20px] w-auto cursor-default"
  >
    <span
      class="icon-[tabler--chevrons-down] text-[1.1em] transition duration-[150ms]"
    ></span>
    <span class="text-[1.1em]">最近</span>
  </h2>
  <div v-else class="flex items-center flex-nowrap mb-[5px]">
    <input
      v-model="searchWords"
      class="w-full pushable focus:shadow-xl hover:shadow-xl transition duration-[160ms]"
    />
    <span
      class="icon-[tabler--search] text-[1.2em] m-[6px] hover:rotate-10 transition duration-[160ms]"
    ></span>
  </div>
  <div class="slide-enter-content">
    <a
      class="list text-very-dark-gray no-underline p-[10px] pl-[20px] mb-[20px] items-center flex flex-wrap hover:shadow-xl transition duration-[240ms]"
      v-for="article in articlesToShow"
      :class="mode === 'Full' ? 'rounded-[10px]' : 'rounded-[8px]'"
      :href="article.url"
    >
      <span
        class="pushable article-link text-sea-blue text-[1.35em] font-bold m-[5px] ml-[2px] mr-0 flex items-center"
      >
        <span>{{ article.title }}</span>
        <span
          class="icon-[tabler--chevrons-right] transition duration-[240ms]"
        ></span>
      </span>
      <div class="w-full"></div>
      <time class="ml-[20px] m-[5px] not-italic">{{ article.pubDate }}</time>
      <span class="ml-[8px]">
        {{ article.author }}
      </span>
      <span
        class="icon-[tabler--ballpen] ml-[3px] transition duration-[160ms]"
      ></span>
      <div class="w-full"></div>
      <div v-if="mode === 'Full'" class="m-[8px] ml-[20px] w-full">
        <p v-for="sentence in article.description" class="m-[6px] ml-0">
          <i>{{ sentence }}</i>
        </p>
      </div>
    </a>
    <a
      v-if="mode === 'Simple'"
      href="/words"
      class="pushable all-articles-link hover:shadow-xl transition duration-[240ms] flex m-auto mt-[33px] mb-[73px] items-center justify-center max-w-[110px] rounded-[10px] p-[5px] hover:p-[7px] text-very-dark-gray"
    >
      <span>全部文章</span>
      <span
        class="ml-[1px] icon-[tabler--chevrons-right] transition duration-[480ms]"
      ></span>
    </a>
  </div>
</template>

<script setup lang="ts">
import { ref, watchEffect } from 'vue'
import type { Article } from '../logics/searchArticle'
import { search } from '../logics/searchArticle'

const props = defineProps<{
  articles: Array<Article>
  mode: 'Full' | 'Simple'
}>()

const articlesToShow = ref(
  props.mode === 'Full' ? props.articles : props.articles.slice(0, 5)
)

// Search article
const searchWords = ref('')
watchEffect(() => {
  if (props.mode === 'Full')
    articlesToShow.value = search(searchWords.value, props.articles)
})
</script>

<style scoped>
.list {
  border: 2px solid var(--very-dark-gray);
}
.list:hover .icon-\[tabler--ballpen\] {
  transform: rotate(-15deg);
}
.title-recent {
  width: intrinsic;
  width: -moz-max-content;
  width: -webkit-max-content;
}
.title-recent:hover .icon-\[tabler--chevrons-down\] {
  transform: translate(0px, 5px);
}
.article-link .icon-\[tabler--chevrons-right\] {
  opacity: 0;
}
.list:hover .icon-\[tabler--chevrons-right\] {
  opacity: 1;
  transform: translate(10px, 0px);
}
.list:hover {
  background-color: var(--very-dark-gray);
}
.list:hover * {
  color: #fff;
}
.list:hover .article-link * {
  color: var(--light-sand-yellow);
}
.all-articles-link {
  border: 2px solid var(--very-dark-gray);
  text-decoration: none;
  user-select: none;
  -webkit-user-select: none;
  -moz-user-select: none;
  -ms-user-select: none;
}
.all-articles-link:hover .icon-\[tabler--chevrons-right\] {
  transform: translate(6px, 0px);
}
.all-articles-link:hover {
  background-image: linear-gradient(
    90deg,
    var(--very-dark-gray),
    var(--dark-gray)
  );
  background-position: center;
  color: #fff;
  border-width: 0;
}
</style>
