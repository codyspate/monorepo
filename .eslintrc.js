module.exports = {
  root: true,
  parser: '@typescript-eslint/parser',
  parserOptions: {
    project: ['./tsconfig.eslint.json'],
    tsconfigRootDir: __dirname
  },
  plugins: ['prettier', '@typescript-eslint', 'import'],
  extends: [
    'eslint:recommended',
    'plugin:@typescript-eslint/recommended',
    'plugin:@typescript-eslint/recommended-requiring-type-checking',
    'plugin:import/warnings',
    'plugin:import/errors',
    'plugin:import/typescript',
    'prettier',
    'prettier/@typescript-eslint'
  ],
  rules: {
    'prettier/prettier': ['error', { endOfLine: 'auto' }],
    'no-console': 'error',
    '@typescript-eslint/no-empty-function': 'off',
    'class-methods-use-this': 'off',
    '@typescript-eslint/array-type': ['error', { default: 'array' }],
    '@typescript-eslint/require-await': 'off',
    'no-console': 'off',
    'no-return-await': 'error',
    '@typescript-eslint/no-explicit-any': 'off',
    'no-use-before-define': 'error',
    'import/order': 2
  },
  env: {
    jest: true,
    node: true
  }
};
