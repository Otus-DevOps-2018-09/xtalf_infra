terraform {
    backend "gcs" {
        bucket = "terraform-2-otus-demo-storage-bucket"
        prefix = "stage"
    }
}