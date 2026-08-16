	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08036024
sub_08036024: @ 0x08036024
	push {r4, r5, lr}
	adds r3, r0, #0
	ldr r2, _08036050 @ =gUnknown_08090EB8
	ldr r5, [r2]
	adds r4, r3, #0
	adds r4, #0x36
	ldrb r1, [r4]
	lsls r0, r1, #3
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r5
	ldrh r1, [r0, #0x1e]
	movs r0, #0x80
	lsls r0, r0, #7
	cmp r1, r0
	beq _08036064
	cmp r1, r0
	bgt _08036054
	cmp r1, #0
	beq _0803609C
	b _08036084
	.align 2, 0
_08036050: .4byte gUnknown_08090EB8
_08036054:
	movs r0, #0x80
	lsls r0, r0, #8
	cmp r1, r0
	bne _08036084
	adds r0, r3, #0
	bl sub_08035E90
	b _0803609C
_08036064:
	ldr r0, _08036080 @ =gUnknown_0849BDE8
	movs r1, #0
	bl sub_080152EC
	ldrb r2, [r4]
	lsls r1, r2, #3
	adds r1, r1, r2
	lsls r1, r1, #2
	adds r2, r5, #0
	adds r2, #0x20
	adds r1, r1, r2
	ldr r1, [r1]
	str r1, [r0, #0x18]
	b _0803609C
	.align 2, 0
_08036080: .4byte gUnknown_0849BDE8
_08036084:
	ldr r2, [r2]
	adds r0, r3, #0
	adds r0, #0x36
	ldrb r1, [r0]
	lsls r0, r1, #3
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	movs r1, #0x1e
	ldrsh r0, [r0, r1]
	bl sub_0803B48C
_0803609C:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0

