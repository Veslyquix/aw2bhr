	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0802BE80
sub_0802BE80: @ 0x0802BE80
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r0, _0802BEB8 @ =gUnknown_0810BDC0
	ldr r1, _0802BEBC @ =gUnknown_03002B6C
	ldr r1, [r1]
	lsls r1, r1, #0x1c
	lsrs r1, r1, #0x1e
	lsls r1, r1, #0xe
	ldr r2, _0802BEC0 @ =0x06005600
	adds r1, r1, r2
	bl Decompress
	movs r4, #0
_0802BE9A:
	adds r0, r4, #0
	movs r1, #6
	movs r2, #0
	bl sub_0802BDBC
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #0xe
	bls _0802BE9A
	movs r0, #0
	strh r0, [r5, #0x1e]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0802BEB8: .4byte gUnknown_0810BDC0
_0802BEBC: .4byte gUnknown_03002B6C
_0802BEC0: .4byte 0x06005600

