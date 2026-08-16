	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0803B5A4
sub_0803B5A4: @ 0x0803B5A4
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _0803B5D8 @ =gUnknown_030005CA
	ldrh r1, [r0]
	ldr r0, _0803B5DC @ =0x0000FFFF
	cmp r1, r0
	beq _0803B5D0
	cmp r4, #0
	bne _0803B5B8
	movs r4, #2
_0803B5B8:
	ldr r0, _0803B5E0 @ =gUnknown_03005AE0
	lsls r1, r4, #0x10
	lsrs r1, r1, #0x10
	bl sub_08070610
	ldr r0, _0803B5E4 @ =gUnknown_0849E750
	movs r1, #3
	bl Proc_Start
	lsls r1, r4, #4
	adds r0, #0x64
	strh r1, [r0]
_0803B5D0:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0803B5D8: .4byte gUnknown_030005CA
_0803B5DC: .4byte 0x0000FFFF
_0803B5E0: .4byte gUnknown_03005AE0
_0803B5E4: .4byte gUnknown_0849E750

