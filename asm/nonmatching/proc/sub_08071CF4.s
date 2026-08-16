	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08071CF4
sub_08071CF4: @ 0x08071CF4
	push {r4, lr}
	ldr r2, _08071D54 @ =gUnknown_030030A4
	ldrb r1, [r2]
	movs r4, #0x20
	orrs r1, r4
	strb r1, [r2]
	ldrb r1, [r2, #1]
	orrs r1, r4
	strb r1, [r2, #1]
	ldr r2, _08071D58 @ =gUnknown_030030DC
	ldrb r1, [r2]
	orrs r1, r4
	strb r1, [r2]
	ldrb r1, [r2, #1]
	orrs r1, r4
	strb r1, [r2, #1]
	ldr r3, _08071D5C @ =gUnknown_030030E0
	ldrb r1, [r3]
	movs r2, #0xc0
	orrs r1, r2
	strb r1, [r3]
	ldr r1, _08071D60 @ =gUnknown_03002020
	movs r2, #0
	strh r2, [r1]
	ldr r1, _08071D64 @ =gUnknown_03002B28
	strh r2, [r1]
	ldr r1, _08071D68 @ =gUnknown_03001FFC
	strh r2, [r1]
	ldrh r2, [r3]
	ldr r1, _08071D6C @ =0x0000FFE0
	ands r1, r2
	movs r2, #0x1f
	orrs r1, r2
	strh r1, [r3]
	ldrb r1, [r3]
	orrs r1, r4
	strb r1, [r3]
	adds r2, r0, #0
	adds r2, #0x64
	movs r3, #0
	movs r1, #0x10
	strh r1, [r2]
	adds r0, #0x66
	strh r3, [r0]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08071D54: .4byte gUnknown_030030A4
_08071D58: .4byte gUnknown_030030DC
_08071D5C: .4byte gUnknown_030030E0
_08071D60: .4byte gUnknown_03002020
_08071D64: .4byte gUnknown_03002B28
_08071D68: .4byte gUnknown_03001FFC
_08071D6C: .4byte 0x0000FFE0

