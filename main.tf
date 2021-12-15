module "testortvpc" {
  source = "./modules/vpc"
  vpc_id  = module.testortvpc.testortvpcid
  adminserver = module.admin_service.admin_service01
  mongooseim01 = module.mongooseim.mongooseim01
 }
module "sg" {
  source = "./modules/sg"
  vpc_id  = module.testortvpc.testortvpcid
  vpccidr = module.testortvpc.vpc_cidr
}
module "cassandra" {
  source = "./modules/cassandra"
  vpc_id  = module.testortvpc.testortvpcid
  environment = var.enveronment
  subnet = module.testortvpc.test_ort_prv_sub1a
  sshsg = module.sg.sshsg
  cassandrasg = module.sg.cassandra
}

module "mysql" {
  source = "./modules/mysql"
  vpc_id  = module.testortvpc.testortvpcid
  environment = var.enveronment
  subnet = module.testortvpc.test_ort_prv_sub1b
  sshsg = module.sg.sshsg
  mysqlsg = module.sg.mysql
}

module "elasticsearch" {
  source = "./modules/elasticsearch"
  vpc_id  = module.testortvpc.testortvpcid
  environment = var.enveronment
  subnet = module.testortvpc.test_ort_prv_sub1a
  sshsg = module.sg.sshsg
  elasticsearchsg = module.sg.elasticsearch
}

module "test_backend" {
  source = "./modules/test_backend"
  vpc_id  = module.testortvpc.testortvpcid
  environment = var.enveronment
  subnet = module.testortvpc.test_ort_prv_sub1b
  sshsg = module.sg.sshsg
  backendsg = module.sg.backend
}

module "contact_socket" {
  source = "./modules/contact_socket"
  vpc_id  = module.testortvpc.testortvpcid
  environment = var.enveronment
  subnet = module.testortvpc.test_ort_prv_sub1a
  sshsg = module.sg.sshsg
  socketsg = module.sg.socket
}
module "contact_sync" {
  source = "./modules/contact_sync"
  vpc_id  = module.testortvpc.testortvpcid
  environment = var.enveronment
  subnet = module.testortvpc.test_ort_prv_sub1a
  sshsg = module.sg.sshsg
}

module "admin_service" {
  source = "./modules/admin_service"
  vpc_id  = module.testortvpc.testortvpcid
  environment = var.enveronment
  subnet = module.testortvpc.test_ort_pub_sub1a
  sshsg = module.sg.sshsg
  adminsg = module.sg.admin
}

module "notifier_service" {
  source = "./modules/notifier_service"
  vpc_id  = module.testortvpc.testortvpcid
  environment = var.enveronment
  subnet = module.testortvpc.test_ort_prv_sub1a
  sshsg = module.sg.sshsg
}
module "push_service" {
  source = "./modules/push_service"
  vpc_id  = module.testortvpc.testortvpcid
  environment = var.enveronment
  subnet = module.testortvpc.test_ort_prv_sub1b
  sshsg = module.sg.sshsg
}
module "test_logging" {
  source = "./modules/test_logging"
  vpc_id  = module.testortvpc.testortvpcid
  environment = var.enveronment
  subnet = module.testortvpc.test_ort_prv_sub1a
  sshsg = module.sg.sshsg
  loggingsg = module.sg.logging
}
