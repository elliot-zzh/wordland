<template>
  <div
    class="pushable max-w-32 m-auto mt-[4dvh] mb-[7dvh] p-0.5 rounded-card flex items-center justify-center cursor-pointer throttle transition duration-220 shadow-md hover:shadow-lg"
    @click="toggle"
  >
    <span
      class="m-1.25"
      :class="
        toLike ? 'icon-[tabler--thumb-up-filled]' : 'icon-[tabler--thumb-up]'
      "
    ></span>
    <span>{{ likesCount }}</span>
  </div>
</template>

<script setup lang="ts">
import { useLocalStorage } from '@vueuse/core'
import { onMounted, ref } from 'vue'
import { getStorageKeyToLike } from '../logics/utils'
import { getArticleLikes, toggleLike } from '../logics/articleLikes'
import { sleep } from '../logics/showUp'

const props = defineProps<{
  name: string
}>()

const toLike = useLocalStorage(getStorageKeyToLike(props.name), false)
const likesCount = ref(0)

const res = await getArticleLikes(props.name)
likesCount.value = res ? (res as number) : 0

onMounted(async () => {
  toLike.value = !toLike.value
  setTimeout(() => {
    toLike.value = !toLike.value
  }, 0)
})

function toggle() {
  toggleLike(props.name, toLike, likesCount)
}
</script>

<style scoped>
div {
  font-family: var(--mono-more);
  background-image: linear-gradient(
    145deg,
    var(--light-sea-blue) 0%,
    var(--sea-blue) 65%,
    var(--dark-sea-blue) 90%,
    var(--dark-sea-blue) 100%
  );
}
div:active {
  transform: scale(1.04, 1.02);
}
div * {
  color: white;
}
</style>
