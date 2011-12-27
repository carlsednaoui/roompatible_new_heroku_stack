Rails.application.config.middleware.use OmniAuth::Builder do
  provider :twitter, '6rfQ60KCe1pKjoSIsybbQ', '9IIzUSq0M4IsAc0uc9lX9YQRQraodTI2fYSy2pPb0'
  provider :facebook, '171269152959002', '983224efedac773020bb19cf5c695d5c'
end
