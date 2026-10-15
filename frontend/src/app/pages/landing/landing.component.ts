import { Component, inject } from '@angular/core';
import { Router } from '@angular/router';
import { CommonModule } from '@angular/common';
import { MockAuthService } from '../../core/services/mock-auth.service';

@Component({
  selector: 'app-landing',
  standalone: true,
  imports: [CommonModule],
  templateUrl: './landing.component.html',
  styleUrl: './landing.component.css'
})
export class LandingComponent {
  private router = inject(Router);
  protected authService = inject(MockAuthService);

  goToLogin(): void {
    if (this.authService.isAuthenticated()) {
      this.router.navigate(['/bienvenida']);
    } else {
      this.router.navigate(['/login']);
    }
  }
}
