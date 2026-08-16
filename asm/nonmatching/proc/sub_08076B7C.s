	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08076B7C
sub_08076B7C: @ 0x08076B7C
	push {r4, lr}
	bl sub_08076888
	ldr r0, _08076BB4 @ =gUnknown_081D0BAC
	ldr r4, _08076BB8 @ =gUnknown_08614280
	ldr r1, [r4]
	bl Decompress
	ldr r0, _08076BBC @ =gUnknown_0202FDFC
	ldrb r0, [r0, #0x11]
	cmp r0, #0
	beq _08076B98
	bl sub_08076B20
_08076B98:
	bl sub_08076858
	bl sub_0807681C
	ldr r0, [r4]
	ldr r1, _08076BC0 @ =0x0600F000
	movs r2, #0x80
	lsls r2, r2, #5
	bl sub_08011E54
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08076BB4: .4byte gUnknown_081D0BAC
_08076BB8: .4byte gUnknown_08614280
_08076BBC: .4byte gUnknown_0202FDFC
_08076BC0: .4byte 0x0600F000

