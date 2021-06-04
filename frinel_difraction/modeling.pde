class modeling {
  float[][] field;
  float v_height, v_width;
  float lambda, v, amp, fi;
  int w_f, h_f;
  int d, len;

  modeling(int w_f, int h_f, int len, int d, float lambda, float v, float amp) {
    this.w_f=w_f;
    this.h_f=h_f;
    this.len=len;
    this.d=d;
    this.lambda=lambda;
    this.v=v;
    this.amp=amp;

    field = new float[w_f][h_f];

    v_height = view1.height();
    v_width = view1.width();
  }

  public void calc() {
    for (int i=0; i<w_f; i++) {
      for (int j=0; j<=d; j++) {
        field[i][j]=amp*cos(2*PI*j/lambda/pow(v, 2)+fi);
        //println(field[i][j]);
      }
    }


    for (int i=0; i<w_f; i++) {
      for (int j=d+1; j<h_f; j++) {
        float sum = 0;
        for (int k=0; k<w_f-len; k++) {
          sum=20*cos(2*PI*(d+sqrt(sq(k-i)+sq(j-d)))/lambda/pow(v, 2)+fi)+sum;
        }
        field[i][j]=sum;
        //println(field[i][j]);
      }
    }
  }

  public void draw_picture() {
    PGraphics v = view1.getGraphics();
    v.beginDraw();
    v.circle(0, 0, 40);

    float dh = v_height/h_f;
    float dw = v_width/w_f;
    float max = field[0][0];
    float min = field[0][0];

    for (int i=0; i<w_f; i++) {
      for (int j=0; j<h_f; j++) {
        if (field[i][j] > max) {
          max = field[i][j];
        }

        if (field[i][j] < min) {
          min = field[i][j];
        }
      }
    }


    for (int i=0; i<w_f; i++) {
      for (int j=0; j<h_f; j++) {
        v.colorMode(RGB, 100, 100, 100);
        color col = color(map(field[i][j], min, max, 0, 100));
        v.fill(col);
        v.rect(i*dw, j*dh, dw, dh);
      }
    }


    v.fill(0);
    v.rect((w_f-len)*dw, d*dh, len*dw, dh);

    v.endDraw();
  }
}
