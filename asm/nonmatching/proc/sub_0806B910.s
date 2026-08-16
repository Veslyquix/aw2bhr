	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0806B910
sub_0806B910: @ 0x0806B910
	push {r4, lr}
	adds r4, r0, #0
	ldr r1, [r4, #0x30]
	movs r0, #0xe8
	lsls r0, r0, #1
	cmp r1, r0
	beq _0806B940
	cmp r1, r0
	bhi _0806B928
	cmp r1, #0
	beq _0806B938
	b _0806B974
_0806B928:
	movs r0, #0xec
	lsls r0, r0, #1
	cmp r1, r0
	beq _0806B94E
	adds r0, #8
	cmp r1, r0
	beq _0806B970
	b _0806B974
_0806B938:
	adds r0, r4, #0
	bl sub_0806AD04
	b _0806B974
_0806B940:
	adds r0, r4, #0
	bl sub_0806AF44
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0806B974
	b _0806B95C
_0806B94E:
	ldr r0, _0806B964 @ =gUnknown_0202F214
	ldrh r1, [r4, #0x2a]
	lsls r1, r1, #2
	adds r1, r1, r0
	ldrh r0, [r1]
	cmp r0, #0
	bne _0806B968
_0806B95C:
	adds r0, r4, #0
	bl Proc_Break
	b _0806B97A
	.align 2, 0
_0806B964: .4byte gUnknown_0202F214
_0806B968:
	adds r0, r4, #0
	bl sub_0806B87C
	b _0806B974
_0806B970:
	movs r0, #0
	b _0806B978
_0806B974:
	ldr r0, [r4, #0x30]
	adds r0, #1
_0806B978:
	str r0, [r4, #0x30]
_0806B97A:
	pop {r4}
	pop {r0}
	bx r0

