	.include "macro.inc"
	.syntax unified
    

	thumb_func_start sub_0800AA30
sub_0800AA30: @ 0x0800AA30
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	adds r4, r0, #0
	adds r5, r1, #0
	movs r6, #0
	cmp r2, #1
	beq _0800AABC
	cmp r2, #1
	bgt _0800AA4C
	cmp r2, #0
	beq _0800AA58
	b _0800ABBC
_0800AA4C:
	cmp r2, #2
	beq _0800AB24
	cmp r2, #4
	bne _0800AA56
	b _0800AB54
_0800AA56:
	b _0800ABBC
_0800AA58:
	ldr r0, _0800AAB8 @ =gUnknown_0808D854
	mov sb, r0
	cmp r4, #0
	ble _0800AA92
	subs r7, r4, #1
	cmp r5, #0
	ble _0800AA70
	subs r1, r5, #1
	adds r0, r7, #0
	bl IsTerrainLand
	adds r6, r0, #0
_0800AA70:
	adds r0, r7, #0
	adds r1, r5, #0
	bl IsTerrainLand
	adds r6, r6, r0
	mov r1, sb
	ldr r0, [r1]
	ldr r0, [r0]
	ldrh r0, [r0, #2]
	subs r0, #1
	cmp r5, r0
	bge _0800AA92
	adds r1, r5, #1
	adds r0, r7, #0
	bl IsTerrainLand
	adds r6, r6, r0
_0800AA92:
	cmp r5, #0
	ble _0800AAA0
	subs r1, r5, #1
	adds r0, r4, #0
	bl IsTerrainLand
	adds r6, r6, r0
_0800AAA0:
	mov r2, sb
	ldr r0, [r2]
	ldr r0, [r0]
	ldrh r0, [r0, #2]
	subs r0, #1
	cmp r5, r0
	blt _0800AAB0
	b _0800ABBC
_0800AAB0:
	adds r1, r5, #1
	adds r0, r4, #0
	b _0800ABB6
	.align 2, 0
_0800AAB8: .4byte gUnknown_0808D854
_0800AABC:
	ldr r1, _0800AB20 @ =gUnknown_0808D854
	ldr r0, [r1]
	mov r8, r0
	ldr r0, [r0]
	ldrh r0, [r0]
	subs r0, #1
	mov sb, r1
	cmp r4, r0
	bge _0800AAFE
	adds r7, r4, #1
	cmp r5, #0
	ble _0800AADE
	subs r1, r5, #1
	adds r0, r7, #0
	bl IsTerrainLand
	adds r6, r0, #0
_0800AADE:
	adds r0, r7, #0
	adds r1, r5, #0
	bl IsTerrainLand
	adds r6, r6, r0
	mov r1, r8
	ldr r0, [r1]
	ldrh r0, [r0, #2]
	subs r0, #1
	cmp r5, r0
	bge _0800AAFE
	adds r1, r5, #1
	adds r0, r7, #0
	bl IsTerrainLand
	adds r6, r6, r0
_0800AAFE:
	cmp r5, #0
	ble _0800AB0C
	subs r1, r5, #1
	adds r0, r4, #0
	bl IsTerrainLand
	adds r6, r6, r0
_0800AB0C:
	mov r2, sb
	ldr r0, [r2]
	ldr r0, [r0]
	ldrh r0, [r0, #2]
	subs r0, #1
	cmp r5, r0
	bge _0800ABBC
	adds r1, r5, #1
	adds r0, r4, #0
	b _0800ABB6
	.align 2, 0
_0800AB20: .4byte gUnknown_0808D854
_0800AB24:
	ldr r0, _0800AB50 @ =gUnknown_0808D854
	mov sb, r0
	cmp r5, #0
	ble _0800AB96
	subs r7, r5, #1
	cmp r4, #0
	ble _0800AB3C
	subs r0, r4, #1
	adds r1, r7, #0
	bl IsTerrainLand
	adds r6, r0, #0
_0800AB3C:
	adds r0, r4, #0
	adds r1, r7, #0
	bl IsTerrainLand
	adds r6, r6, r0
	mov r1, sb
	ldr r0, [r1]
	ldr r0, [r0]
	b _0800AB84
	.align 2, 0
_0800AB50: .4byte gUnknown_0808D854
_0800AB54:
	ldr r1, _0800ABCC @ =gUnknown_0808D854
	ldr r0, [r1]
	mov r8, r0
	ldr r0, [r0]
	ldrh r0, [r0, #2]
	subs r0, #1
	mov sb, r1
	cmp r5, r0
	bge _0800AB96
	adds r7, r5, #1
	cmp r4, #0
	ble _0800AB76
	subs r0, r4, #1
	adds r1, r7, #0
	bl IsTerrainLand
	adds r6, r0, #0
_0800AB76:
	adds r0, r4, #0
	adds r1, r7, #0
	bl IsTerrainLand
	adds r6, r6, r0
	mov r1, r8
	ldr r0, [r1]
_0800AB84:
	ldrh r0, [r0]
	subs r0, #1
	cmp r4, r0
	bge _0800AB96
	adds r0, r4, #1
	adds r1, r7, #0
	bl IsTerrainLand
	adds r6, r6, r0
_0800AB96:
	cmp r4, #0
	ble _0800ABA4
	subs r0, r4, #1
	adds r1, r5, #0
	bl IsTerrainLand
	adds r6, r6, r0
_0800ABA4:
	mov r2, sb
	ldr r0, [r2]
	ldr r0, [r0]
	ldrh r0, [r0]
	subs r0, #1
	cmp r4, r0
	bge _0800ABBC
	adds r0, r4, #1
	adds r1, r5, #0
_0800ABB6:
	bl IsTerrainLand
	adds r6, r6, r0
_0800ABBC:
	adds r0, r6, #0
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_0800ABCC: .4byte gUnknown_0808D854

