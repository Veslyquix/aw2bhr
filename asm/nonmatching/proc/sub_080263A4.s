	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_080263A4
sub_080263A4: @ 0x080263A4
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	lsls r0, r0, #0x18
	lsrs r7, r0, #0x18
	ldr r0, _080263E8 @ =gUnknown_085C77A0
	mov r8, r0
	ldr r6, _080263EC @ =gUnknown_03003FC0
	ldrb r0, [r6, #2]
	movs r5, #0x5c
	muls r0, r5, r0
	add r0, r8
	ldrh r4, [r0, #0x20]
	bl sub_0803866C
	cmp r0, #0
	beq _080263CE
	ldrb r0, [r6, #2]
	muls r0, r5, r0
	add r0, r8
	ldrh r4, [r0, #0x22]
_080263CE:
	adds r0, r7, #0
	bl sub_080266DC
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08026416
	ldr r1, _080263F0 @ =gUnknown_03004080
	ldrh r0, [r1]
	cmp r0, r4
	bhi _080263F4
	movs r0, #0x64
	b _08026418
	.align 2, 0
_080263E8: .4byte gUnknown_085C77A0
_080263EC: .4byte gUnknown_03003FC0
_080263F0: .4byte gUnknown_03004080
_080263F4:
	ldrh r1, [r1]
	lsls r0, r4, #2
	cmp r1, r0
	bge _08026416
	subs r1, r1, r4
	movs r0, #0x64
	muls r0, r1, r0
	lsls r1, r4, #1
	adds r1, r1, r4
	bl __divsi3
	adds r1, r0, #0
	movs r0, #0x64
	subs r0, r0, r1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	b _08026418
_08026416:
	movs r0, #0
_08026418:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0

