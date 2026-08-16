	.include "macro.inc"
	.syntax unified
    

	thumb_func_start sub_080110EC
sub_080110EC: @ 0x080110EC
	push {r4, lr}
	adds r4, r0, #0
	ldr r1, _08011100 @ =gUnknown_03002B5C
	ldrh r0, [r1]
	cmp r0, #0
	bne _08011104
	adds r0, r4, #0
	bl Proc_End
	b _0801112E
	.align 2, 0
_08011100: .4byte gUnknown_03002B5C
_08011104:
	movs r0, #0
	strh r0, [r1]
	bl sub_08010FA0
	ldr r2, _08011134 @ =gUnknown_030030E0
	ldrb r0, [r2]
	movs r1, #0xc0
	orrs r0, r1
	strb r0, [r2]
	ldr r1, _08011138 @ =gUnknown_03001FFC
	movs r0, #0x10
	strh r0, [r1]
	adds r1, r4, #0
	adds r1, #0x64
	movs r0, #0x80
	lsls r0, r0, #1
	strh r0, [r1]
	adds r1, #2
	movs r0, #0x80
	lsls r0, r0, #5
	strh r0, [r1]
_0801112E:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08011134: .4byte gUnknown_030030E0
_08011138: .4byte gUnknown_03001FFC

