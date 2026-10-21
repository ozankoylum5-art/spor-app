ALTER TABLE public.profiller ENABLE ROW LEVEL SECURITY;
ALTER TABLE public.antrenman_gunlugu ENABLE ROW LEVEL SECURITY;
ALTER TABLE public.favoriler ENABLE ROW LEVEL SECURITY;

-- Kullanıcı sadece kendi ID'sine ait verileri görebilir ve değiştirebilir
CREATE POLICY "Kullanici kendi profilini yonetir" ON public.profiller
  FOR ALL USING (auth.uid() = kullanici_id) WITH CHECK (auth.uid() = kullanici_id);

CREATE POLICY "Kullanici kendi antrenmanini yonetir" ON public.antrenman_gunlugu
  FOR ALL USING (auth.uid() = kullanici_id) WITH CHECK (auth.uid() = kullanici_id);

CREATE POLICY "Kullanici kendi favorilerini yonetir" ON public.favoriler
  FOR ALL USING (auth.uid() = kullanici_id) WITH CHECK (auth.uid() = kullanici_id);

ALTER TABLE public.kaslar ENABLE ROW LEVEL SECURITY;
ALTER TABLE public.hareketler ENABLE ROW LEVEL SECURITY;
ALTER TABLE public.hareket_kas_etkisi ENABLE ROW LEVEL SECURITY;

CREATE POLICY "Kaslar herkese acik" ON public.kaslar FOR SELECT USING (true);
CREATE POLICY "Hareketler herkese acik" ON public.hareketler FOR SELECT USING (true);
CREATE POLICY "Hareket kas etkisi herkese acik" ON public.hareket_kas_etkisi FOR SELECT USING (true);

CREATE OR REPLACE FUNCTION public.yeni_kullanici_profili_olustur()
RETURNS trigger
LANGUAGE plpgsql
SECURITY DEFINER SET search_path = ''
AS $$
BEGIN
  INSERT INTO public.profiller (kullanici_id)
  VALUES (new.id)
  ON CONFLICT (kullanici_id) DO NOTHING;
  RETURN new;
END;
$$;

CREATE OR REPLACE TRIGGER on_auth_user_created
  AFTER INSERT ON auth.users
  FOR EACH ROW
  EXECUTE FUNCTION public.yeni_kullanici_profili_olustur();
