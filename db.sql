PGDMP     4                     {         
   Ask_Online    12.16    12.16                0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false                       0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false                       0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false                       1262    16578 
   Ask_Online    DATABASE     �   CREATE DATABASE "Ask_Online" WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'Russian_Russia.1251' LC_CTYPE = 'Russian_Russia.1251';
    DROP DATABASE "Ask_Online";
                postgres    false            �            1259    16625    answers    TABLE     h   CREATE TABLE public.answers (
    id integer NOT NULL,
    "user" integer,
    q integer,
    a text
);
    DROP TABLE public.answers;
       public         heap    postgres    false                       0    0    TABLE answers    ACL     -   GRANT ALL ON TABLE public.answers TO PUBLIC;
          public          postgres    false    204            �            1259    16612 	   questions    TABLE     [   CREATE TABLE public.questions (
    id integer NOT NULL,
    "user" integer,
    q text
);
    DROP TABLE public.questions;
       public         heap    postgres    false                       0    0    TABLE questions    ACL     /   GRANT ALL ON TABLE public.questions TO PUBLIC;
          public          postgres    false    203            �            1259    16604    users    TABLE     F   CREATE TABLE public.users (
    id integer NOT NULL,
    name text
);
    DROP TABLE public.users;
       public         heap    postgres    false                       0    0    TABLE users    ACL     +   GRANT ALL ON TABLE public.users TO PUBLIC;
          public          postgres    false    202                      0    16625    answers 
   TABLE DATA           3   COPY public.answers (id, "user", q, a) FROM stdin;
    public          postgres    false    204   �                 0    16612 	   questions 
   TABLE DATA           2   COPY public.questions (id, "user", q) FROM stdin;
    public          postgres    false    203   *                 0    16604    users 
   TABLE DATA           )   COPY public.users (id, name) FROM stdin;
    public          postgres    false    202   p       �
           2606    16632    answers answers_pkey 
   CONSTRAINT     R   ALTER TABLE ONLY public.answers
    ADD CONSTRAINT answers_pkey PRIMARY KEY (id);
 >   ALTER TABLE ONLY public.answers DROP CONSTRAINT answers_pkey;
       public            postgres    false    204            �
           2606    16624    questions questions_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public.questions
    ADD CONSTRAINT questions_pkey PRIMARY KEY (id);
 B   ALTER TABLE ONLY public.questions DROP CONSTRAINT questions_pkey;
       public            postgres    false    203            �
           2606    16611    users users_pkey 
   CONSTRAINT     N   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);
 :   ALTER TABLE ONLY public.users DROP CONSTRAINT users_pkey;
       public            postgres    false    202            �
           2606    16638 	   answers q    FK CONSTRAINT     f   ALTER TABLE ONLY public.answers
    ADD CONSTRAINT q FOREIGN KEY (q) REFERENCES public.questions(id);
 3   ALTER TABLE ONLY public.answers DROP CONSTRAINT q;
       public          postgres    false    204    2699    203            �
           2606    16618    questions user    FK CONSTRAINT     n   ALTER TABLE ONLY public.questions
    ADD CONSTRAINT "user" FOREIGN KEY ("user") REFERENCES public.users(id);
 :   ALTER TABLE ONLY public.questions DROP CONSTRAINT "user";
       public          postgres    false    2697    202    203            �
           2606    16633    answers user    FK CONSTRAINT     l   ALTER TABLE ONLY public.answers
    ADD CONSTRAINT "user" FOREIGN KEY ("user") REFERENCES public.users(id);
 8   ALTER TABLE ONLY public.answers DROP CONSTRAINT "user";
       public          postgres    false    202    204    2697               3   x�3�4�4�tJMN,-N�2�4�<S��@�gFi�1P�!g^>W� �	|         6   x�3�4�Ϩ��22��3��
KS�K2��8�y�%�E\1z\\\ ��|         #   x�3�L��LN�N�2�,-N-2�2�F\1z\\\ �(!     