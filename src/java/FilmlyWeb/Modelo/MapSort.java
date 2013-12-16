package FilmlyWeb.Modelo;

import java.util.Comparator;
import java.util.Map;

public class MapSort {

    static class ValueComparator implements Comparator<String> {

        Map<Pelicula, Double> base;

        ValueComparator(Map<Pelicula, Double> base) {
            this.base = base;
        }

        @Override
        public int compare(String a, String b) {
            Double x = base.get(a);
            Double y = base.get(b);
            if ( x.equals(y) ) {
                return b.compareTo(a);
            }
            return y.compareTo(x);
        }
    }
}
