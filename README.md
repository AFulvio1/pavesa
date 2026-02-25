# PA.VE.SA. s.r.l. - Sito Web Aziendale

Sito web statico costruito con **Hugo**, un generatore di siti statici veloce e flessibile. Il progetto include un tema custom, contenuti multilingue e integrazione con Cloudinary per la gestione delle immagini.

## Componenti del Progetto

### 1. **Generatore di Siti Statici (Hugo)**
- Framework principale per la generazione del sito statico
- Configurazione in `config.toml`
- Build veloce e deploy semplice
- Supporto per i18n (multilingue)

### 2. **Struttura dei Contenuti**
- **`content/`**: Pagine e servizi del sito (azienda, contatti, privacy, servizi)
- **`layouts/`**: Template HTML personalizzati
  - Layout di default per liste e pagine singole
  - Template per pagine
  - Shortcode custom per lavori e contenuti
  - Partials per componenti (navbar, footer, carousel, ecc.)

### 3. **Dati Gestiti in YAML**
- **`data/carousel/`**: Immagini del carousel
- **`data/clients/`**: Clienti del progetto
- **`data/providers/`**: Provider e partner tecnologici

### 4. **Localizzazione (i18n)**
- **`i18n/`**: File di traduzione per 15 lingue (IT, EN, ES, FR, DE, e altre)
- Supporto multilingue automatico

### 5. **Asset Statici**
- **`static/`**: CSS, font, immagini e JavaScript
- **`public/`**: Output compilato del sito (generato da Hugo)

### 6. **Dipendenze Node.js**
- `cloudinary`: Gestione immagini responsive
- `jquery`: Interattività frontend
- `lightbox2`: Lightbox per gallerie
- `eslint`: Linting del codice
- `netlify-plugin-submit-sitemap`: Plugin per Netlify

### 7. **Configurazioni**
- **`netlify.toml`**: Configurazione deploy su Netlify
- **`cloudinary.yml`**: Configurazione Cloudinary
- **`package.json`**: Dipendenze Node.js

## Installazione e Setup

### Prerequisiti
- Hugo (Extended version consigliata)
- Node.js >= 14
- npm

### Installare le dipendenze
```bash
npm install
```

## Comandi Utili per Hugo

### Sviluppo locale
```bash
hugo server
# Il sito sarà disponibile su: http://localhost:1313
```

### Build per produzione
```bash
hugo --minify
# Genera il sito ottimizzato in ./public
```

### Build in draft mode (include contenuti bozza)
```bash
hugo server -D
hugo -D
```

### Pulire i file compilati
```bash
rm -r public
# Su Windows PowerShell:
Remove-Item -Recurse -Force .\public
```

### Verificare configurazione
```bash
hugo config
```

### Creare nuovo contenuto
```bash
hugo new content/nomefile.md
# Per i servizi:
hugo new content/servizi/nuovo-servizio.md
```

## Aggiornamento Dipendenze

### Verificare aggiornamenti disponibili
```bash
npm outdated
```

### Aggiornare tutte le dipendenze (con cautela)
```bash
npm update
```

### Aggiornare dipendenza specifica
```bash
npm install <package>@latest
```

### Aggiornare dipendenza di sviluppo
```bash
npm install --save-dev <package>@latest
```

### Audit e fix vulnerabilità
```bash
npm audit
npm audit fix
```

### Installazione di Hugo standalone (alternativa)
Se Hugo non è disponibile nel sistema, can installarlo:

**Su Windows (con Chocolatey):**
```powershell
choco install hugo-extended
```

**Su Windows (manuale):**
Scarica da [gohugo.io/installation](https://gohugo.io/installation/windows/) e aggiungi alla PATH

**Su macOS (with Homebrew):**
```bash
brew install hugo
```

**Su Linux:**
```bash
# Ubuntu/Debian
apt-get install hugo

# Fedora/RHEL
dnf install hugo
```

## Stato Dipendenze e Sicurezza

### Audit Dipendenze (Febbraio 2026)

**✅ Zero Vulnerabilità** - Il progettoè libero da vulnerabilità di sicurezza grazie agli aggiornamenti

#### Aggiornamenti Effettuati:
- ✅ **Rimosso** `hugo@0.0.3` npm (obsoleto, contiene dipendenze vulnerabili)
  - Ora usa Hugo come binario standalone del sistema operativo (v0.123.3+)
  - **Beneficio:** Eliminazione di 15 vulnerabilità (3 critiche, 9 alte, 3 moderate)
  
- ✅ **Aggiornato** `cloudinary@1.41.3` → `cloudinary@2.9.0`
  - Fix per vulnerabilità alta: Arbitrary Argument Injection
  
- ✅ **Aggiornato** `jquery@3.6.3` → `jquery@3.7.1`
  - Minor release, compatibilità garantita

- ✅ **Aggiornato** `cloudinary-core@2.13.0` → `2.14.1`
- ✅ **Aggiornato** `cloudinary-jquery-file-upload@2.13.0` → `2.14.1`
- ✅ **Aggiornato** `lightbox2@2.11.4` → `2.11.5`

#### Dipendenze Outdated (Non Critiche)

Le seguenti sono dev dependencies (ESLint) con major version updates disponibili:
- `eslint-config-standard`: 6.2.1 → 17.1.0 (consigliato: attendere testing)
- `eslint-plugin-promise`: 3.8.0 → 7.2.1 (consigliato: attendere testing)
- `eslint-plugin-standard`: 2.3.1 → 4.1.0 (consigliato: attendere testing)
- `jquery`: 3.7.1 → 4.0.0 (major, attendere testing di compatibilità)

### Raccomandazioni per Aggiornamenti Futuri

1. **ESLint (dev dependencies)**: I major version updates di ESLint non influenzano il runtime
   - Consigliato aggiornare quando si ha tempo per testing
   - Non blocca il deploy

2. **jQuery 4.0.0**: Prima di aggiornare:
   - Testare completamente il sito frontend
   - Verificare compatibilità con Lightbox2
   - Verificare script personalizzati in `static/js/`

3. **Monitoraggio**: Eseguire `npm audit` regolarmente (almeno mensilmente)

4. **Alternativa futura**: 
   - Considerare di spostare il tema Hugo in un repository Git esterno
   - Questo migliorerebbe la manutenibilità a lungo termine

## Strutura del Deploy

Il sito è deployato su **Netlify** con automazione:
- Build command: `hugo --minify`
- Publish directory: `public`
- Il plugin Netlify sottomette automaticamente la sitemap

## Note Importanti

- Le immagini sono gestite via Cloudinary per ottimizzazione automatica
- Il sito è multilingue - i contenuti sono tradotti nei vari file `i18n/*.yaml`
- Il tema è custom e non è un tema Hugo scaricabile da temi.gohugo.io
- La struttura è ottimizzata per SEO con sitemap automatica
