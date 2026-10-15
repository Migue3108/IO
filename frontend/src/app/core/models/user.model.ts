export interface User {
  id: number;
  username: string;
  fullName: string;
  role: 'Administrador' | 'Operador' | 'Auditor' | 'QA Lead';
  token: string;
  avatarUrl?: string;
  lastLogin: Date;
}

export interface LoginCredentials {
  username: string;
  password: string;
}

export interface AuthResponse {
  success: boolean;
  message?: string;
  user?: User;
}

