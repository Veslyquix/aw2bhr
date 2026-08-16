	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08071D70
sub_08071D70: @ 0x08071D70
	push {lr}
	adds r2, r0, #0
	ldr r3, _08071D84 @ =gUnknown_03001FFC
	ldrh r0, [r3]
	cmp r0, #0x10
	bne _08071D88
	adds r0, r2, #0
	bl Proc_End
	b _08071DAE
	.align 2, 0
_08071D84: .4byte gUnknown_03001FFC
_08071D88:
	adds r1, r2, #0
	adds r1, #0x66
	adds r0, r2, #0
	adds r0, #0x64
	ldrh r0, [r0]
	ldrh r2, [r1]
	adds r0, r0, r2
	strh r0, [r1]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0xff
	ble _08071DA6
	movs r0, #0x80
	lsls r0, r0, #1
	strh r0, [r1]
_08071DA6:
	ldrh r0, [r1]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x14
	strh r0, [r3]
_08071DAE:
	pop {r0}
	bx r0
	.align 2, 0

