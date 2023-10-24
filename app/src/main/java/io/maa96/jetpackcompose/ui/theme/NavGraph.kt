package io.maa96.jetpackcompose.ui.theme

import androidx.compose.runtime.Composable
import androidx.navigation.NavHostController
import androidx.navigation.compose.NavHost
import androidx.navigation.compose.composable

@Composable
fun setupNavGraph(
    navHostController: NavHostController
) {

    NavHost(
        navController = navHostController,
        startDestination = Screen.Home.route
    ){
        composable(
            route = Screen.Home.route
        ) {
            HomeScreen(
                navHostController = navHostController
            )
        }
        composable(
            route = Screen.PostDetail.route
        ) {
            detailScreen(
                navHostController = navHostController
            )
        }
    }
    
}