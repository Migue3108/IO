import { Routes } from '@angular/router';
import { LandingComponent } from './pages/landing/landing.component';
import { LoginComponent } from './pages/login/login.component';
import { WelcomeComponent } from './pages/welcome/welcome.component';
import { authGuard } from './core/guards/auth.guard';

export const routes: Routes = [
  {
    path: '',
    redirectTo: 'inicio',
    pathMatch: 'full'
  },
  {
    path: 'inicio',
    component: LandingComponent,
    title: 'Sistema IO - Presentación y Control de Equipos'
  },
  {
    path: 'login',
    component: LoginComponent,
    title: 'Sistema IO - Iniciar Sesión'
  },
  {
    path: 'bienvenida',
    component: WelcomeComponent,
    canActivate: [authGuard],
    title: 'Sistema IO - Bienvenido'
  },
  {
    path: '**',
    redirectTo: 'inicio'
  }
];
