package io.maa96.jetpackcompose.ui.theme

sealed class Screen (val route : String) {
    object Home : Screen(route = "home_screen")
    object PostDetail : Screen(route = "post_detail_screen")
}
