import { render, screen } from '@testing-library/react';
import { MemoryRouter } from 'react-router-dom';
import { fireEvent } from '@testing-library/react';
import App from './App';
import FormRegistration from "./pages/Register";

const RouterWrapper = ({ children }) => {
  return <MemoryRouter initialEntries={['/']}>{children}</MemoryRouter>;
};

test('Check if the text se connecter entreprise is on the page', () => {
  render(
      <App />
  );

  // Assert that the Main component is rendered
  expect(screen.getByText('Se connecter entreprise')).toBeInTheDocument();
});

test('Check if the text se connecter is on the page', () => {
  render(
    <App />
  );

  // Assert that the FormRegistration component is rendered
  expect(screen.getByText('Se connecter')).toBeInTheDocument();
});


test('Check if the text Inscription is on the reister page', () => {
  render(<FormRegistration />);
  expect(screen.getByText('Inscription')).toBeInTheDocument();
});

test('Check if the placeholder Adresse e-mail is on the reister page', () => {
  render(<FormRegistration />);
  expect(screen.getByPlaceholderText('Adresse e-mail')).toBeInTheDocument();
});

test('Check if the text placeholder Mot de passe is on the reister page', () => {
  render(<FormRegistration />);
  expect(screen.getByPlaceholderText('Mot de passe')).toBeInTheDocument();
});

// Add more tests for other routes/components
