(** * Interface to the Lwt library. *)
Require Import Extraction.BigInt.
Require Import Extraction.String.

(** The `Lwt.t` type. *)
Parameter t : Type -> Type.
Extract Constant t "'a" => "'a Lwt.t".

(** Return. *)
Parameter ret : forall {A : Type}, A -> t A.
Extract Constant ret => "Lwt.return".

(** Bind. *)
Parameter bind : forall {A B : Type}, t A -> (A -> t B) -> t B.
Extract Constant bind => "Lwt.bind".

(** Join. *)
Parameter join : forall {A B : Type}, t A -> t B -> t (A * B).
Extract Constant join => "ExtractionLwt.join".

(** Choose. *)
Parameter choose : forall {A : Type}, t A -> t A -> t A.
Extract Constant choose => "ExtractionLwt.choose".

(** Launch. *)
Parameter launch : forall {A : Type}, t A -> A.
Extract Constant launch => "Lwt_main.run".

(** List the files of a directory. *)
Parameter list_files : String.t -> t (option (list String.t)).
Extract Constant list_files => "ExtractionLwt.list_files".

(** The the content of a file. *)
Parameter read_file : String.t -> t (option String.t).
Extract Constant read_file => "ExtractionLwt.read_file".

(** Update (or create) a file with some content. *)
Parameter write_file : String.t -> String.t -> t bool.
Extract Constant write_file => "ExtractionLwt.write_file".

(** Delete a file. *)
Parameter delete_file : String.t -> t bool.
Extract Constant delete_file => "ExtractionLwt.delete_file".

(** Run a command. *)
Parameter system : String.t -> t (option bool).
Extract Constant system => "ExtractionLwt.system".

(** Run a command controlling the outputs. *)
Parameter eval : list String.t -> t (option (BigInt.t * String.t * String.t)).
Extract Constant eval => "ExtractionLwt.eval".

(** Print a message on the standard output. *)
Parameter print : String.t -> t bool.
Extract Constant print => "ExtractionLwt.print".

(** Read a line on the standard input. *)
Parameter read_line : unit -> t (option String.t).
Extract Constant read_line => "ExtractionLwt.read_line".
