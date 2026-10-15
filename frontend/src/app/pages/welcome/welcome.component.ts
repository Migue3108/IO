import { Component, inject } from '@angular/core';
import { Router } from '@angular/router';
import { CommonModule } from '@angular/common';
import { MockAuthService } from '../../core/services/mock-auth.service';

@Component({
  selector: 'app-welcome',
  standalone: true,
  imports: [CommonModule],
  templateUrl: './welcome.component.html',
  styleUrl: './welcome.component.css'
})
export class WelcomeComponent {
  private router = inject(Router);
  protected authService = inject(MockAuthService);

  logout(): void {
    this.authService.logout();
    this.router.navigate(['/login']);
  }
}
