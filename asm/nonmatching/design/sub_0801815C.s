	.include "macro.inc"
	.syntax unified
    

	thumb_func_start sub_0801815C
sub_0801815C: @ 0x0801815C
	push {r4, r5, lr}
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	movs r5, #9
	bl sub_08078198
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08018170
	movs r5, #1
_08018170:
	ldr r0, _0801818C @ =gUnknown_03002B6C
	ldr r1, [r0]
	lsls r1, r1, #0x1c
	lsrs r1, r1, #0x1e
	lsls r1, r1, #0xe
	ldr r0, _08018190 @ =0x06004160
	adds r1, r1, r0
	adds r0, r4, #0
	adds r2, r5, #0
	bl sub_08043E3C
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0801818C: .4byte gUnknown_03002B6C
_08018190: .4byte 0x06004160

