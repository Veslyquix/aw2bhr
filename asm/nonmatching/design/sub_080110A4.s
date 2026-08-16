	.include "macro.inc"
	.syntax unified
    

	thumb_func_start sub_080110A4
sub_080110A4: @ 0x080110A4
	push {lr}
	adds r1, r0, #0
	ldr r3, _080110B8 @ =gUnknown_03001FFC
	ldrh r0, [r3]
	cmp r0, #0x10
	bne _080110BC
	adds r0, r1, #0
	bl Proc_End
	b _080110E2
	.align 2, 0
_080110B8: .4byte gUnknown_03001FFC
_080110BC:
	adds r2, r1, #0
	adds r2, #0x66
	adds r0, r1, #0
	adds r0, #0x64
	ldrh r0, [r0]
	ldrh r1, [r2]
	adds r0, r0, r1
	strh r0, [r2]
	lsls r0, r0, #0x10
	ldr r1, _080110E8 @ =0x0FFF0000
	cmp r0, r1
	ble _080110DA
	movs r0, #0x80
	lsls r0, r0, #5
	strh r0, [r2]
_080110DA:
	ldrh r0, [r2]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x18
	strh r0, [r3]
_080110E2:
	pop {r0}
	bx r0
	.align 2, 0
_080110E8: .4byte 0x0FFF0000

