	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0802BEC4
sub_0802BEC4: @ 0x0802BEC4
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	ldrh r6, [r5, #0x1e]
	movs r4, #0
	movs r1, #0x1e
	ldrsh r0, [r5, r1]
	cmp r4, r0
	bge _0802BEFC
_0802BED4:
	adds r1, r6, #0
	lsls r0, r1, #0x10
	ldr r2, _0802BF10 @ =0xFFFF0000
	adds r0, r0, r2
	lsrs r6, r0, #0x10
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	adds r0, r4, #0
	movs r2, #1
	bl sub_0802BDBC
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	movs r1, #0x1e
	ldrsh r0, [r5, r1]
	cmp r4, r0
	bge _0802BEFC
	cmp r4, #0xe
	bls _0802BED4
_0802BEFC:
	bl sub_08013AEC
	ldrh r1, [r5, #0x1e]
	movs r2, #0x1e
	ldrsh r0, [r5, r2]
	cmp r0, #0x15
	bne _0802BF14
	movs r0, #0
	str r0, [r5, #8]
	b _0802BF18
	.align 2, 0
_0802BF10: .4byte 0xFFFF0000
_0802BF14:
	adds r0, r1, #1
	strh r0, [r5, #0x1e]
_0802BF18:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0

