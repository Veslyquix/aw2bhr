	.include "macro.inc"
	.syntax unified
    

	thumb_func_start sub_08011054
sub_08011054: @ 0x08011054
	push {r4, lr}
	adds r4, r0, #0
	ldr r1, _08011068 @ =gUnknown_03002B5C
	ldrh r0, [r1]
	cmp r0, #1
	bne _0801106C
	adds r0, r4, #0
	bl Proc_End
	b _08011096
	.align 2, 0
_08011068: .4byte gUnknown_03002B5C
_0801106C:
	movs r0, #1
	strh r0, [r1]
	bl sub_08010FA0
	ldr r2, _0801109C @ =gUnknown_030030E0
	ldrb r0, [r2]
	movs r1, #0xc0
	orrs r0, r1
	strb r0, [r2]
	ldr r1, _080110A0 @ =gUnknown_03001FFC
	movs r0, #0
	strh r0, [r1]
	adds r1, r4, #0
	adds r1, #0x64
	movs r2, #0
	movs r0, #0x80
	lsls r0, r0, #1
	strh r0, [r1]
	adds r0, r4, #0
	adds r0, #0x66
	strh r2, [r0]
_08011096:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0801109C: .4byte gUnknown_030030E0
_080110A0: .4byte gUnknown_03001FFC

