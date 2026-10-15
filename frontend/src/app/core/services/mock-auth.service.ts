import { Injectable, signal, computed } from '@angular/core';
import { Observable, of, throwError } from 'rxjs';
import { delay, tap } from 'rxjs/operators';
import { User, LoginCredentials } from '../models/user.model';

@Injectable({
  providedIn: 'root'
})
export class MockAuthService {
  private readonly STORAGE_USER_KEY = 'io_auth_user';
  private readonly STORAGE_TOKEN_KEY = 'io_auth_token';

  // Accepted mock credentials
  private readonly VALID_USERS = [
    { username: 'admin', password: 'password123', fullName: 'Administrador', role: 'Administrador' as const },
    { username: 'admin', password: 'admin', fullName: 'Administrador', role: 'Administrador' as const },
    { username: 'usuario', password: 'password123', fullName: 'Usuario Operativo', role: 'Operador' as const },
    { username: 'usuario', password: '1234', fullName: 'Usuario Operativo', role: 'Operador' as const }
  ];

  private currentUserSignal = signal<User | null>(this.getStoredUser());
  public currentUser = this.currentUserSignal.asReadonly();
  public isAuthenticated = computed(() => this.currentUserSignal() !== null);

  public login(credentials: LoginCredentials): Observable<User> {
    const username = credentials.username?.trim().toLowerCase();
    const password = credentials.password?.trim();

    const matched = this.VALID_USERS.find(
      u => u.username.toLowerCase() === username && u.password === password
    );

    if (!matched) {
      return throwError(() => new Error('Usuario o contraseña incorrectos.')).pipe(
        delay(400)
      );
    }

    const user: User = {
      id: 1,
      username: matched.username,
      fullName: matched.fullName,
      role: matched.role,
      token: 'mock-jwt-token-' + Math.random().toString(36).substring(2),
      lastLogin: new Date()
    };

    return of(user).pipe(
      delay(400),
      tap(u => {
        try {
          localStorage.setItem(this.STORAGE_USER_KEY, JSON.stringify(u));
          localStorage.setItem(this.STORAGE_TOKEN_KEY, u.token);
        } catch {}
        this.currentUserSignal.set(u);
      })
    );
  }

  public logout(): void {
    try {
      localStorage.removeItem(this.STORAGE_USER_KEY);
      localStorage.removeItem(this.STORAGE_TOKEN_KEY);
    } catch {}
    this.currentUserSignal.set(null);
  }

  private getStoredUser(): User | null {
    try {
      const stored = localStorage.getItem(this.STORAGE_USER_KEY);
      if (stored) {
        return JSON.parse(stored);
      }
    } catch {}
    return null;
  }
}
