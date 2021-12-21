<script>
  import { onMount } from "svelte";
  import auth from "./authService";
  import { isAuthenticated, user, user_scenarios, scenarios } from "./store";
  // import TaskItem from "./components/TaskItem.svelte";

  let auth0Client;
  let newTask;

  onMount(async () => {
    auth0Client = await auth.createClient();

    isAuthenticated.set(await auth0Client.isAuthenticated());
    user.set(await auth0Client.getUser());
  });

  function login() {
    auth.loginWithPopup(auth0Client);
  }

  function logout() {
    auth.logout(auth0Client);
  }

  // function addItem() {
  //   let newTaskObject = {
  //     id: genRandom(),
  //     description: newTask,
  //     completed: false,
  //     user: $user.email
  //   };

  //   console.log(newTaskObject);

  //   let updatedTasks = [...$tasks, newTaskObject];

  //   tasks.set(updatedTasks);

  //   newTask = "";
  // }

  // function genRandom(length = 7) {
  //   var chars =
  //     "0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ";
  //   var result = "";
  //   for (var i = length; i > 0; --i)
  //     result += chars[Math.round(Math.random() * (chars.length - 1))];
  //   return result;
  // }
</script>

<main>
  {#if $isAuthenticated}
  <p>Welcome:&nbsp;{$user.name} ({$user.email})</p>
  {/if}

  {#if !$isAuthenticated}
    <a
      class="btn btn-primary btn-lg mr-auto ml-auto"
      href="/#"
      role="button"
      on:click="{login}"
    >Log In</a>
  {:else}
    <h1>Logged in!</h1>
    <a
    class="btn btn-primary btn-lg mr-auto ml-auto"
    href="/#"
    role="button"
    on:click="{logout}"
  >Log Out</a>
    <p>{JSON.stringify(scenarios)}</p>
  {/if}
</main>

<!-- <style>
  #main-application {
    margin-top: 50px;
  }
</style> -->