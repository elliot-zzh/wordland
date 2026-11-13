<template>
  <div class="slide-enter-content">
    <div
      v-for="author in AUTHORS"
      class="list p-5 mb-5 rounded-card hover:shadow-xl transition duration-240"
    >
      <h2 class="author-name text-[1.3em] m-0 mb-1.25">{{ author.cnName }}</h2>
      <div class="flex flex-wrap m-2.5">
        <span
          v-for="badge in author.badges"
          class="badge text-white leading-none m-1.25 p-1.75 rounded-badge shadow-sm hover:shadow-md transition duration-160"
        >
          {{ badge }}
        </span>
      </div>
      <p class="m-0 ml-3.75 flex items-center email">
        <span
          class="icon-[tabler--mailbox] mx-1.5 transition duration-160"
        ></span>
        <i class="text-[1.06rem]">{{ author.email }}</i>
      </p>
    </div>
  </div>
</template>

<script setup lang="ts">
import { AUTHORS } from '../config'
</script>

<style scoped>
.list {
  border: 2px solid var(--very-dark-gray);
}
.list * {
  text-decoration: none;
}
.list:hover {
  background-color: var(--very-dark-gray);
}
.list:hover *:not(.badge) {
  color: #fff;
}
.list:hover .author-name,
.list:hover .email {
  text-decoration: underline var(--very-dark-gray);
}
.list:hover .icon-\[tabler--mailbox\] {
  transform: translateY(-3px);
}
.list:hover .author-name {
  color: var(--light-sand-yellow);
}
</style>
