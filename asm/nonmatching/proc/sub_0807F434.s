	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0807F434
sub_0807F434: @ 0x0807F434
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	adds r4, r0, #0
	movs r5, #0
	ldr r7, _0807F44C @ =gUnknown_081D936C
	ldr r6, _0807F450 @ =gUnknown_081D9370
	ldr r0, _0807F454 @ =gUnknown_081D9374
	mov sl, r0
	b _0807F478
	.align 2, 0
_0807F44C: .4byte gUnknown_081D936C
_0807F450: .4byte gUnknown_081D9370
_0807F454: .4byte gUnknown_081D9374
_0807F458:
	ldr r1, _0807F488 @ =gUnknown_030058D4
	adds r1, r5, r1
	ldr r0, _0807F48C @ =gUnknown_030058E0
	adds r0, r5, r0
	ldrb r0, [r0]
	strb r0, [r1]
	ldrb r0, [r1]
	lsls r1, r5, #1
	adds r1, r1, r5
	lsls r1, r1, #2
	movs r2, #0xf0
	lsls r2, r2, #2
	adds r1, r1, r2
	bl sub_08043B14
	adds r5, #1
_0807F478:
	bl sub_0803BD14
	cmp r5, r0
	blt _0807F458
	movs r5, #0
	adds r4, #0x4c
	mov sb, r4
	b _0807F4B2
	.align 2, 0
_0807F488: .4byte gUnknown_030058D4
_0807F48C: .4byte gUnknown_030058E0
_0807F490:
	cmp r5, #2
	beq _0807F4B0
	ldr r0, _0807F51C @ =gUnknown_030058D4
	adds r0, r5, r0
	ldrb r4, [r0]
	adds r0, r5, #0
	movs r1, #2
	bl DivRem
	lsls r1, r0, #2
	adds r1, r1, r0
	lsls r1, r1, #6
	adds r2, r5, #1
	adds r0, r4, #0
	bl sub_08043BA4
_0807F4B0:
	adds r5, #1
_0807F4B2:
	bl sub_0803BD14
	cmp r5, r0
	blt _0807F490
	ldr r0, [r7]
	ldr r4, [r6]
	adds r1, r4, #0
	bl sub_08011CAC
	movs r5, #0
	mov r8, r4
_0807F4C8:
	adds r7, r5, #1
	lsls r1, r5, #0xb
	lsls r0, r5, #8
	mov r2, r8
	adds r5, r0, r2
	movs r6, #7
	ldr r0, _0807F520 @ =0x06015000
	adds r4, r1, r0
_0807F4D8:
	adds r0, r5, #0
	adds r1, r4, #0
	movs r2, #0x40
	bl CpuFastSet
	movs r1, #0x80
	lsls r1, r1, #1
	adds r4, r4, r1
	movs r2, #0x80
	lsls r2, r2, #3
	adds r5, r5, r2
	subs r6, #1
	cmp r6, #0
	bge _0807F4D8
	adds r5, r7, #0
	cmp r5, #3
	ble _0807F4C8
	movs r4, #0
	mov r1, sl
	ldr r0, [r1]
	movs r1, #0xa0
	lsls r1, r1, #2
	movs r2, #0x20
	bl sub_08013618
	mov r2, sb
	strh r4, [r2]
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0807F51C: .4byte gUnknown_030058D4
_0807F520: .4byte 0x06015000

